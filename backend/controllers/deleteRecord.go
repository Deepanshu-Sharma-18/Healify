package controllers

import (
	"context"
	"fmt"
	"net/http"
	"time"

	"encoding/json"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/gin-gonic/gin"
)

func DeleteRecord(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	type DocumentId struct {
		DocumentId string `bson:"documentId" json:"documentId" validate:"required"`
	}

	var documentId DocumentId

	if err := c.BindJSON(&documentId); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	record, err := initializers.Client.Record.FindUnique(
		db.Record.ID.Equals(documentId.DocumentId),
	).Delete().Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(record, "", "  ")
	fmt.Printf("delete: %s\n", result)

}
