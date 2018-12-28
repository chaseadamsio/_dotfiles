package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
)

const (
	codeFenceBacktickDelimLf = "```"
	codeFenceTildeDelimLf    = "~~~"
)

var fileName string
var outFilename string

func init() {
	flag.StringVar(&fileName, "filename", "", "Markdown file you want to tangle")
	flag.StringVar(&outFilename, "out", "", "Filename to write to")
	flag.Parse()
}

func main() {
	out, ext, _ := getCodeFromFile(fileName)
	err := createFile(fileName, out, ext)
	if err != nil {
		log.Fatal(err)
	}
}

func createFile(fileName, out, ext string) (err error) {
	newFilename := ""
	if outFilename != "" {
		newFilename = outFilename
	} else {
		newFilename = strings.Replace(fileName, ".md", "."+ext, 1)
	}

	file, err := os.Create(newFilename)
	if err != nil {
		return err
	}
	defer file.Close()
	file.Write([]byte(out))
	fmt.Printf("Generating file %s from code blocks in %s\n", fileName, newFilename)
	return nil
}

func getCodeFromFile(fileName string) (string, string, map[string]string) {
	file, err := os.Open(fileName)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	return parse(file)
}

func parseInfoString(infoString []string) (info map[string]string) {
	if len(infoString) > 1 {
		for _, infoItem := range infoString[1:] {
			item := strings.Split(infoItem, "=")
			if len(item) > 1 {
				key := item[0]
				val := item[1]
				info[key] = val
			} else {
				fmt.Printf("Ignoring key '%s' because it is not a valid infostring.\n", item[0])
			}
		}
	}
	return info
}

func isCodeFenceDelim(line string) bool {
	return strings.HasPrefix(line, codeFenceBacktickDelimLf) || strings.HasPrefix(line, codeFenceTildeDelimLf)
}

func parse(file *os.File) (string, string, map[string]string) {
	inCodeFence := false
	info := make(map[string]string)
	ext := ""
	contents := ""
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		l := scanner.Text()
		if isCodeFenceDelim(l) {
			if !inCodeFence {
				inCodeFence = true
				infoString := strings.Split(l[3:], " ")
				// set extension for filename based on first code fence encountered
				ext = infoString[0]
				info = parseInfoString(infoString[1:])
				continue
			} else {
				inCodeFence = false
				continue
			}
		}

		if inCodeFence {
			contents += l + "\n"
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	return contents, ext, info
}
