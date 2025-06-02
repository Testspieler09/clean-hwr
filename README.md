# Typst Template for HWR (Berlin School of Economics and Law)

Welcome! This repository offers two Typst templates (English and German) designed to help you write your papers following the HWR style guidelines.

## What is Typst?

Typst is a modern, user-friendly typesetting system that makes creating beautiful documents easy and fun. If you’re new to Typst, you can learn more [here](https://typst.app/docs/).

### Using Typst

You can work with Typst **online** right away at [typst.app](https://typst.app/) — no installation needed!

If you prefer to work **locally** on your computer, just follow the [official installation guides](https://github.com/typst/typst#installation) to set it up easily.

## Preview the Templates

Want to see how the templates look? Check out the [`preview`](https://github.com/Testspieler09/ptb_template/tree/preview) branch to get a quick visual.

## Getting Started

1. **Fork or clone** this repository to your computer.
2. Open the files and start customizing your paper!

## Template Structure

To help you get started quickly and customize easily, the template is organized like this:

```
.
├── assets
│   ├── bib      # Your bibliography entries and citation styles go here
│   └── images   # Put any images you want to use in your paper here
├── blocks       # Contains all the page components that are combined in main.typ
├── LICENSE
├── main.typ     # The main file that pulls everything together into one document
└── README.md
```

This setup makes it easy to add new sections, update references, or swap images without hassle.

You can find the **german** version on the [`de`](https://github.com/Testspieler09/ptb_template/tree/de) branch

### Dependencies

This template makes use of two Typst packages to add extra functionality:

* [`glossarium`](https://typst.app/universe/package/glossarium/) – for managing glossaries
* [`acrostiche`](https://typst.app/universe/package/acrostiche/) – for handling acronyms easily

These are fetched automatically when compiling the document, so you don’t need to install them manually.

### Quick Shoutout

Big thanks to [**Patrick O'Brien**](https://github.com/POBrien333) for creating the citation style file used in this template. You can find it at:

```
assets/bib/hwr_citation.csl
```

Original source: [Berlin School of Economics and Law CSL Style](https://github.com/citation-style-language/styles/blob/master/berlin-school-of-economics-and-law-international-marketing-management.csl)

> [!NOTE]
> To use the custom citation style, make sure to set the bibliography like this in your Typst file:
>
> ```typst
> #set bibliography(
>   style: "assets/bib/hwr_citation.csl",
> )
> ```

## How to Create a PDF

Once you’ve made your changes, you can compile your document into a PDF by running this command in the root folder of the project:

```bash
typst compile main.typ
```

This will generate a `main.pdf` file with your paper ready to go.

## Need Help or Want to Contribute?

If you run into any issues or have ideas to improve the template, please open an issue or submit a pull request. Your feedback is always welcome!
