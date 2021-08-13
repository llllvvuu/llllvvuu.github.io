module MDXRemote = {
  @module("next-mdx-remote") @react.component
  external make: (~compiledSource: string, ~components: 'a=?) =>
    React.element = "MDXRemote"
}
