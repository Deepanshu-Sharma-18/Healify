package controllers

import (
	"context"
	"net/http"
	"time"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-gonic/gin"
)

func GenerateUploadPresignedUrl(c *gin.Context) {

	type File struct {
		BucketName string            `json:"bucketName" validate:"required"`
		ObjectKey  string            `json:"objectKey" validate:"required"`
		Metadata   map[string]string `json:"metadata"`
	}

	var file File

	if err := c.BindJSON(&file); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	cfg, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion("us-west-2"))
	if err != nil {
		panic(err)
	}

	client := s3.NewFromConfig(cfg)

	svc := s3.NewPresignClient(client)

	expiration := time.Minute * 10

	req, err := svc.PresignPutObject(context.Background(), &s3.PutObjectInput{
		Bucket:   aws.String(file.BucketName),
		Key:      aws.String(file.ObjectKey),
		Metadata: file.Metadata,
	},
		func(o *s3.PresignOptions) {
			o.Expires = expiration
		})

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"url": req.URL, "method": req.Method, "signedHeader": req.SignedHeader, "expiration": expiration})

}

func GenerateDownloadPresignUrl(c *gin.Context) {

	type File struct {
		BucketName string `json:"bucketName" validate:"required"`
		ObjectKey  string `json:"objectKey" validate:"required"`
	}

	var file File

	if err := c.BindJSON(&file); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	cfg, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion("us-west-2"))
	if err != nil {
		panic(err)
	}

	svc := s3.NewPresignClient(s3.NewFromConfig(cfg))

	req, err := svc.PresignGetObject(context.Background(), &s3.GetObjectInput{
		Bucket: aws.String(file.BucketName),
		Key:    aws.String(file.ObjectKey),
	}, func(o *s3.PresignOptions) {
		o.Expires = time.Hour * 24 * 31 * 12
	})

	if err != nil {
		panic(err)
	}

	c.JSON(http.StatusOK, gin.H{"url": req.URL, "method": req.Method, "signedHeader": req.SignedHeader})
}
