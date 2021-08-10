import fs from 'fs'
import matter from 'gray-matter'
import path from 'path'
import { make as Meta } from 'src/components/Meta.mjs'
import { make as Layout } from 'src/layouts/Layout.mjs'

export const config = { unstable_runtimeJS: false };

export default function IndexPage({ frontMatter }) {
  return (
    <>
      <Meta title="llllvvuu" />
      <Layout>
        {frontMatter.map(item => (
          <>
            <h2 className="text-2xl font-serif text-blue-800 dark:text-yellow-200">
              <a href={"/blog/" + item.name + ""}>
                {item.data.title}
              </a>
            </h2>
            <h3 className="font-serif">
              {item.data.description}
            </h3>
            <h4 className="font-serif italic mb-2">
              {item.data.date}
            </h4>
          </>
        ))}
      </Layout>
    </>
  )
}

export const getStaticProps = async () => {
  const POSTS_PATH = path.join(process.cwd(), 'articles')
  // postFilePaths is the list of all mdx files inside the POSTS_PATH directory
  const postFilePaths = fs
    .readdirSync(POSTS_PATH)
    // Only include md(x) files
    .filter((path) => /\.mdx?$/.test(path))

  const frontMatter = postFilePaths
    .map(name => ({ name: name.replace(/\.mdx?$/, ''), fullName: path.join(POSTS_PATH, name) }))
    .map(({ name, fullName }) => ({ name, md: fs.readFileSync(fullName) }))
    .map(({ name, md }) => ({ name, data: matter(md).data}))

  return {
    props: {
      frontMatter,
    },
  }
}
