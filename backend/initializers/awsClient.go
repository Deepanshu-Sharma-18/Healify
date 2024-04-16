package initializers

import (
	"context"

	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/s3"
)

var PresignClient *s3.PresignClient

func InitPresignClient() {
	cfg, err := config.LoadDefaultConfig(context.TODO(), config.WithRegion("eu-north-1"))
	if err != nil {
		panic(err)
	}

	client := s3.NewFromConfig(cfg)

	svc := s3.NewPresignClient(client)
	PresignClient = svc
}
