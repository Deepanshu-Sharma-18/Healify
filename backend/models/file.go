package models

type File struct {
	Id         string            `json:"id"`
	BucketName string            `json:"bucketname" validate:"required"`
	ObjectKey  string            `json:"objectkey" validate:"required"`
	Content    string            `json:"content" validate:"required"`
	Username   string            `json:"username" validate:"required"`
	Metadata   map[string]string `json:"metadata"`
}
