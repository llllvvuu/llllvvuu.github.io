type props = {
  source: { "compiledSource": string },
  frontMatter: PostInfo.frontMatter,
}

type aProps = {
  children: React.element,
  href: string,
}

type componentProps = {
  children: React.element,
}

let components = {
  "h2": ({ children }) =>
    <h2 className="text-xl mt-2">children</h2>,
  "h3": ({ children }) =>
    <h3 className="text-lg mt-1">children</h3>,
  "ul": ({ children }) =>
    <ul className="list-disc list-inside my-1">children</ul>,
  "p.inlineCode": ({ children }) =>
    <code className="p-0.5 rounded-sm">children</code>,
  "pre": ({ children }) =>
    <pre className="overflow-auto p-2 my-2 rounded shadow">children</pre>,
  "a": ({ children, href }) =>
    <a href target={href->Js.String2.startsWith("/") ? "" : "_blank"}>
      children
    </a>,
  "Remark": ({ children }) => <Remark>children</Remark>,
  "IM": ({ children }) => <Katex.InlineMath>children</Katex.InlineMath>,
  "BM": ({ children }) => <div className="overflow-auto">
    <Katex.BlockMath>children</Katex.BlockMath>
  </div>,
  "sp": () => " "->React.string,
}

let default = props => {
  let { source, frontMatter } = props
  let { title, description } = frontMatter
  let compiledSource = source["compiledSource"]

  <>
    <Meta title description />
    <Layout>
      <PostInfo frontMatter />
      <main>
        <MDXRemote.MDXRemote compiledSource components />
      </main>
    </Layout>
  </>
}
