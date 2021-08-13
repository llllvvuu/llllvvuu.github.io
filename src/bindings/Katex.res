module InlineMath = {
  @module("react-katex") @react.component
  external make: (~children: React.element) => React.element = "InlineMath"
}

module BlockMath = {
  @module("react-katex") @react.component
  external make: (~children: React.element) => React.element = "BlockMath"
}
