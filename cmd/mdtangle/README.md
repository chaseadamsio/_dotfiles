# mdtangle

An experiment in using literate programming with Markdown (CommonMark/Github Flavored Markdown).

## Motivation

I've been using literate programming for my dotfiles and various devops tasks over the past two years but I've always done it with Org Mode and Emacs.

As much as I've enjoyed it, I didn't like the fact that literate programming was tied to a specific editor that had a "high barrier to entry" that a lot of developers were unable to use.

As much as I like Org mode, Markdown—specifically CommonMark and Github Flavored Markdown—have the advantage of network effect. Markdown has become the default markup language that developers use for documentation.

Despite some limitations of Markdown (Org mode is _incredibly_ powerful, especially when paired with Emacs), I realized that it would be possible to leverage the existing spec to achieve most of the things I use Emacs and Org mode for with Markdown and any editor.

## Usage

Tangling relies heavily on the use of two properties in a file:

- **Frontmatter** of a document
- **InfoString** of a specific code fence

### Frontmatter

| Property | Value      | Action                                                            |
| :------- | :--------- | :---------------------------------------------------------------- |
| tangle   | <filename> | The filename that will be used for the current file being tangled |

### InfoString

| Property | Values              | Action                                                                               |
| :------- | :------------------ | :----------------------------------------------------------------------------------- |
| tangle   | yes, no, <filename> | If yes, defaults to being tangled to the frontmatter property or the filename output |

## Tasks

- [x] Read a markdown file
- [x] Find a code fence beginning and end for ```
- [ ] Find a code fence beginning and end for ~~~
- [x] Extract contents of the code blocks from a Markdown file into a file of the same name with a file extension derived from the language identifier of the `src` block.
- [x] Extract contents of the code blocks from a Markdown file into a file based on a flag for `out`
