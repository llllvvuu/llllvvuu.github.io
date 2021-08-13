type props = {
  "filenames": array<string>,
  "frontMatters": array<PostInfo.frontMatter>,
}

let default = (props: props) => {
  <>
    <Meta title="llllvvuu" description="" />
    <Layout>
      {Belt.Array.zip(props["filenames"], props["frontMatters"])
        ->Js.Array2.map(
         ((filename, frontMatter)) =>
           <PostInfo filename frontMatter key={filename} />
        )->React.array}
    </Layout>
  </>
}
