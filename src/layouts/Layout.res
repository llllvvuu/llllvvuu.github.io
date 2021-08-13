@react.component
let make = (~children) =>
  <div className="max-w-screen-md mx-auto p-4">
    <h1 className="text-center">
      <a href="/">
        {"llllvvuu"->React.string}
      </a>
    </h1>
    <h6 className="text-center mb-6 black">
      <a href="https://github.com/llllvvuu" target="_blank">
        <MaterialIcons.GitHub className="m-1" />
      </a>
      <a href="https://twitter.com/llllvvuu" target="_blank">
        <MaterialIcons.Twitter className="m-1" />
      </a>
    </h6>
    {children}
  </div>
