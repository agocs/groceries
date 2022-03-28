# Grocieries

A collection of templates and scripts for easy grocery lists from your text editor of choice.
Inspired by a [twitter rant](https://twitter.com/agoX/status/1482132235729969154)

## Requirements

- [pandoc](https://pandoc.org/)
- `pdflatex` or some other LaTeX engine. Install (on a mac) using `brew install --cask basictex`
- Assumes you will have `lp` and a default printer set up. You can test this by `echo "test page" | lp` and seeing what happens.

## Installation

`./scripts/install.sh`

## Usage

This creates a `.groceries` directory with template grocery lists in `.groceries/templates`. 
I've included one template by default -- this is the template for the Fairway grocery store near my apartment. 
I have one H2 section for each aisle in Fairway. 
I recommend you edit the template to match your home grocery store, or create multiple templates for each of the grocery stores you frequent.

`groceries new` will create a new grocery list.

`groceries new kroger.md` will create a new grocery list using the `kroger.md` template in `~/.groceries/templates` (if there is one)

`groceries print` will compile `groceries.md` in your present working directory into a PDF and send it to a printer.
