type frontMatter = {
  title: string,
  description: string,
  date: string,
  twitter: option<string>,
}

@react.component
let make: (~frontMatter: frontMatter, ~filename: string=?) => React.element
