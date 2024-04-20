package controllers

import (
	"context"
	"fmt"
	"net/http"
	"time"

	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/service/s3"
	"github.com/gin-gonic/gin"
)

func GenerateUploadPresignedUrl(c *gin.Context) {

	type File struct {
		BucketName string            `json:"bucketname" validate:"required"`
		ObjectKey  string            `json:"objectkey" validate:"required"`
		Content    string            `json:"content" validate:"required"`
		Username   string            `json:"username" validate:"required"`
		Metadata   map[string]string `json:"metadata"`
	}

	var file File

	if err := c.BindJSON(&file); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	expiration := time.Minute * 10

	req, err := initializers.PresignClient.PresignPutObject(context.Background(), &s3.PutObjectInput{
		Bucket:   aws.String(file.BucketName),
		Key:      aws.String(fmt.Sprintf("%s/%s/%s", file.Username, file.Content, file.ObjectKey)),
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
		Username   string `json:"username" validate:"required"`
		Content    string `json:"content" validate:"required"`
	}

	var file File

	if err := c.BindJSON(&file); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	req, err := initializers.PresignClient.PresignGetObject(context.Background(), &s3.GetObjectInput{
		Bucket: aws.String(file.BucketName),
		Key:    aws.String(fmt.Sprintf("%s/%s/%s", file.Username, file.Content, file.ObjectKey)),
	}, func(o *s3.PresignOptions) {
		o.Expires = time.Hour * 24 * 6
	})

	if err != nil {
		panic(err)
	}

	c.JSON(http.StatusOK, gin.H{"url": req.URL, "method": req.Method, "signedHeader": req.SignedHeader})
}
