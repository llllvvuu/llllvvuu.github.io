module Switch = {
  @module("@headlessui/react") @react.component
  external make: (
    ~checked: bool,
    ~onChange: (bool => bool) => unit,
    ~className: string=?,
    ~children: React.element
  ) => React.element = "Switch"
}
