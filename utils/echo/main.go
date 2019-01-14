package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	fmt.Printf("%s", formatInput(os.Args[1:]))
}

func formatInput(s []string) string {
	compatableDisableNewLine := "\\c"
	shouldNewLine := false

	if len(s) == 0 {
		return "\n"
	} else if s[0] == "-n" { // if -n flag is passed in, remove it from slice
		s = s[1:]
	} else if s[len(s)-1] == compatableDisableNewLine { // if compatableDisableNewLine is last element, remove it
		s = s[:len(s)-1]
	} else if strings.HasSuffix(s[len(s)-1], compatableDisableNewLine) { // if compatableDisableNewLine is with a part of element, remove it
		s[len(s)-1] = strings.TrimSuffix(s[len(s)-1], compatableDisableNewLine)
	} else { // caller wants a newline
		shouldNewLine = true
	}

	out := strings.Join(s, " ")

	if shouldNewLine {
		out += "\n"
	}

	return out
}
