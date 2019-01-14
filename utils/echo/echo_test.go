package main

import (
	"fmt"
	"testing"
)

func TestEcho(t *testing.T) {
	cases := []struct {
		testCase string
		input    []string
		expected string
	}{
		{"empty", []string{}, "\n"},
		{"basic", []string{"hello", "world"}, "hello world\n"},
		{"no newline -n", []string{"-n", "hello", "world"}, "hello world"},
		{"no newline \\c", []string{"hello", "world\\c"}, "hello world"},
		{"no newline \\c with space", []string{"hello", "world", "\\c"}, "hello world"},
	}
	for _, c := range cases {
		t.Run(c.testCase, func(t *testing.T) {
			actual := formatInput(c.input)
			if actual != c.expected {
				fmt.Println([]byte(actual), "\n", []byte(c.expected))
				t.Errorf("%s %s does not match %s", c.testCase, actual, c.expected)
			}
		})
	}
}
