@react.component
let make = (~children) => {
  let (dark, setDark) = React.useState(_ => false)

  <div className={dark ? "dark" : ""}>
    <div className="bg-white dark:bg-black ease-in-out duration-200
      text-black dark:text-white min-h-screen">
      <div className="max-w-screen-md mx-auto p-4">
        <h1 className="text-center text-4xl font-serif">
          <a href="/">
            {"llllvvuu"->React.string}
          </a>
        </h1>
        <div className="text-center mb-6">
          <a href="https://github.com/llllvvuu" target="_blank">
            <MaterialIcons.GitHub className="m-1" />
          </a>
          <a href="https://twitter.com/llllvvuu" target="_blank">
            <MaterialIcons.Twitter className="m-1" />
          </a>
        </div>
        {children}
      </div>
    </div>
  </div>
}
