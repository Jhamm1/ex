package main

import (
	"bytes"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	"github.com/DATA-DOG/godog"
)

var (
	server   *httptest.Server
	reader   io.Reader //Ignore this for now
	usersUrl string
)

func init() {
	usersUrl = "http://localhost:8090" //Grab the address for the API endpoint
}

var (
	successOK  string = "200 OK"
	BadRequest string = "404 Bad Request"
)

func TestMain(m *testing.M) {
	status := godog.RunWithOptions("api", func(s *godog.Suite) {
		FeatureContext(s)
	}, godog.Options{
		Format: "progress",
		Paths:  []string{"features"},
		//Randomize: time.Now().UTC().UnixNano(), // randomize scenario execution order
	})

	if st := m.Run(); st > status {
		status = st
	}
	os.Exit(status)
}

func TestEndpoint(t *testing.T) {
	//Counter++
	versionendpoint := usersUrl + "/message"

	var jsonStr = []byte(`{
		"Message": "Hello world"
	  }`)
	req, err := http.NewRequest("GET", versionendpoint, bytes.NewBuffer(jsonStr))
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Errorf("Error occured %v", err)
		//panic(err)
	}
	defer resp.Body.Close()

	fmt.Println("Response code:  " + resp.Status)

}

func FeatureContext(s *godog.Suite) {
	s.Step(`This is an API example$`, TestEndpoint)

}
