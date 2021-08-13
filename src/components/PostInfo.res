type frontMatter = {
  title: string,
  description: string,
  date: string,
  twitter: option<string>,
}

@react.component
let make = (~frontMatter: frontMatter, ~filename: option<string>=?) =>
  <>
    <h2>
      {switch filename {
      | None => {frontMatter.title->React.string}
      | Some(name) =>
        <a href={"/blog/" ++ name}>
          {frontMatter.title->React.string}
        </a>
      }}
    </h2>
    <h3>
      {frontMatter.description->React.string}
    </h3>
    <h4 className="italic mb-2">
      {frontMatter.date->React.string}
      {switch frontMatter.twitter {
      | None => <></>
      | Some(twitter) =>
        <a
          href={twitter}
          className="mx-1 text-blue-500"
          target="_blank"
        >
          <MaterialIcons.Twitter fontSize="small" />
        </a>
      }}
    </h4>
  </>
