package main

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
)

func main() {
	if err := run(); err != nil {
		panic(err)
	}
}

func run() error {
	client := db.NewClient()
	if err := client.Prisma.Connect(); err != nil {
		return err
	}

	defer func() {
		if err := client.Prisma.Disconnect(); err != nil {
			panic(err)
		}
	}()

	ctx := context.Background()

	createdUser, err := client.User.CreateOne(
		db.User.Name.Set("Alice"),
		db.User.Username.Set("Alice"),
		db.User.Address.Set("Alice"),
		db.User.Image.Set("Alice"),
		db.User.Age.Set("20"),
		db.User.Bloodgroup.Set("A+"),
		db.User.Gender.Set("male"),
		db.User.Height.Set("5.8"),
		db.User.Weight.Set("70"),
	).Exec(ctx)
	if err != nil {
		return err
	}

	result, _ := json.MarshalIndent(createdUser, "", "  ")
	fmt.Printf("created post: %s\n", result)

	// // find a single post
	// post, err := client.Post.FindUnique(
	// 	db.Post.ID.Equals(createdPost.ID),
	// ).Exec(ctx)
	// if err != nil {
	// 	return err
	// }

	// result, _ = json.MarshalIndent(post, "", "  ")
	// fmt.Printf("post: %s\n", result)

	// for optional/nullable values, you need to check the function and create two return values
	// `desc` is a string, and `ok` is a bool whether the record is null or not. If it's null,
	// `ok` is false, and `desc` will default to Go's default values; in this case an empty string (""). Otherwise,
	// `ok` is true and `desc` will be "my description".
	// desc, ok := post.Desc()
	// if !ok {
	// 	return fmt.Errorf("post's description is null")
	// }

	// fmt.Printf("The posts's description is: %s\n", desc)

	return nil
}
