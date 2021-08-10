@react.component
let make = (~dark, ~setDark) => {
  <div className="fixed top-4 right-4">
    <HeadlessUI.Switch checked={dark} onChange={setDark} className={`${
      dark ? "bg-blue-600" : "bg-gray-200"
    } relative inline-flex items-center h-6 rounded-full w-11
    ease-in-out duration-200`}>
      <span className="sr-only">
        {"Enable notifications"->React.string}
      </span>
      <span
        className={`${
          dark ? "translate-x-6" : "translate-x-1"
        } inline-block w-4 h-4 transform bg-white rounded-full
        ease-in-out duration-200`}
      />
    </HeadlessUI.Switch>
  </div>
}
