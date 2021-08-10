import fs from 'fs'
import matter from 'gray-matter'
import { MDXRemote } from 'next-mdx-remote'
import { serialize } from 'next-mdx-remote/serialize'
import path from 'path'
import { make as Meta } from 'src/components/Meta.mjs'
import { make as Layout } from 'src/layouts/Layout.mjs'
import Twitter from '@material-ui/icons/Twitter';

export const config = { unstable_runtimeJS: false };

// Custom components/renderers to pass to MDX.
// Since the MDX files aren't loaded by webpack, they have no knowledge of how
// to handle import statements. Instead, you must include components in scope
// here.
const components = {
  h2: ({ children }) => <h2 className="text-xl font-serif mt-2">{children}</h2>,
  ul: ({ children }) => <ul className="list-disc list-inside my-1">{children}</ul>,
  'p.inlineCode': ({ children }) => <code
    className="bg-yellow-100 text-yellow-900 text-xs p-0.5 rounded-sm dark:bg-blue-900 dark:text-blue-100"
    >{children}</code>,
  pre: ({ children }) => <pre
    className="text-xs overflow-auto bg-yellow-100 text-yellow-900 p-2 my-2 rounded shadow dark:bg-blue-900 dark:text-blue-100"
   >{children}</pre>,
  a: ({ children, ...props }) => <a
    className="text-blue-700 dark:text-yellow-200 ease-in-out duration-200"
    {...props} target="_blank">{children}</a>,
  Info: ({ children }) => <div
    className="p-2 border-l-8 border-blue-300 bg-blue-100 my-2 dark:border-yellow-600 dark:bg-yellow-800"
    >{children}</div>
}

export default function PostPage({ source, frontMatter }) {
  return (
    <>
      <Meta title={frontMatter.title} description={frontMatter.description} />
      <Layout>
        <h2 className="text-2xl font-serif">
          {frontMatter.title}
        </h2>
        <h3 className="font-serif">
          {frontMatter.description}
        </h3>
        <h4 className="font-serif italic mb-2">
          {frontMatter.date}
          {frontMatter.twitter && <a href={frontMatter.twitter} className="mx-1 text-blue-500" target="_blank"><Twitter fontSize="small" /></a>}
        </h4>
        <main>
          <MDXRemote {...source} components={components} />
        </main>
      </Layout>
    </>
  )
}

export const getStaticProps = async ({ params }) => {
  const POSTS_PATH = path.join(process.cwd(), 'articles')
  const postFilePath = path.join(POSTS_PATH, `${params.slug}.mdx`)
  const source = fs.readFileSync(postFilePath)

  const { content, data } = matter(source)

  const mdxSource = await serialize(content, {
    // Optionally pass remark/rehype plugins
    mdxOptions: {
      remarkPlugins: [],
      rehypePlugins: [],
    },
    scope: data,
  })

  return {
    props: {
      source: mdxSource,
      frontMatter: data,
    },
  }
}

export const getStaticPaths = async () => {
  const POSTS_PATH = path.join(process.cwd(), 'articles')
  // postFilePaths is the list of all mdx files inside the POSTS_PATH directory
  const postFilePaths = fs
    .readdirSync(POSTS_PATH)
    // Only include md(x) files
    .filter((path) => /\.mdx?$/.test(path))

  const paths = postFilePaths
    // Remove file extensions for page paths
    .map((path) => path.replace(/\.mdx?$/, ''))
    // Map the path into the static paths object required by Next.js
    .map((slug) => ({ params: { slug } }))

  return {
    paths,
    fallback: false,
  }
}
