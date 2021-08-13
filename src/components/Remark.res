@react.component
let make = (~children) =>
  <div
    className={`p-2 border-l-8 border-blue-300 bg-blue-100 my-2
      dark:border-yellow-600 dark:bg-yellow-800`}
  >
    {children}
  </div>
