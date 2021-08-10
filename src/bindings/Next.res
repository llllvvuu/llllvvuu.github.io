module Head = {
  @module("next/head") @react.component
  external make: (~children: React.element) => React.element = "default"
}

module Link = {
  @module("next/link") @react.component
  external make: (~href: string, ~children: React.element) => React.element = "default"
}
