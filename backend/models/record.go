package models

type Record struct {
	Id        string   `bson:"_id" json:"id"`
	Title     string   `bson:"title" json:"title" validate:"required"`
	Date      string   `bson:"date" json:"date" validate:"required"`
	Symptoms  []string `bson:"symptoms" json:"symptoms" validate:"required"`
	Diagnosis []string `bson:"diagnosis" json:"diagnosis" validate:"required"`
	Treatment []string `bson:"treatment" json:"treatment" validate:"required"`
	Reports   []File   `bson:"reports" json:"reports" validate:"required"`
	UserId    string   `bson:"userid" json:"userid" validate:"required"`
}
