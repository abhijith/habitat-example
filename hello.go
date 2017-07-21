package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"time"
)

func main() {
	file := flag.String("file", "config/version", "path to file")
	flag.Parse()

	for {
		dat, err := ioutil.ReadFile(*file)
		if err != nil {
			panic(err)
		}

		fmt.Println(string(dat))
		time.Sleep(time.Second * 1)
	}
}
