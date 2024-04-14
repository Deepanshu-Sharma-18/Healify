package models

type User struct {
	Name       string   `bson:"name" json:"name" validate:"required"`
	Username   string   `bson:"username" json:"username" validate:"required"`
	Height     string   `bson:"height" json:"height" validate:"required"`
	Weight     string   `bson:"weight" json:"weight" validate:"required"`
	Age        string   `bson:"age" json:"age" validate:"required"`
	Bloodgroup string   `bson:"bloodgroup" json:"bloodgroup" validate:"required"`
	Gender     string   `bson:"gender" json:"gender" validate:"required"`
	Records    []Record `bson:"records" json:"records"`
	Address    string   `bson:"address" json:"address" validate:"required"`
	Image      string   `bson:"image" json:"image"`
}
