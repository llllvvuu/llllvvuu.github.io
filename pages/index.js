import fs from 'fs';
import matter from 'gray-matter';
import path from 'path';

import IndexRes from "src/pages/Index.mjs";

export const config = { unstable_runtimeJS: false };

const Index = props => <IndexRes {...props} />;

export const getStaticProps = _ctx => {
  const POSTS_PATH = path.join(process.cwd(), 'articles');

  const postFilePaths = fs
    .readdirSync(POSTS_PATH)
    .filter((path) => /\.mdx?$/.test(path));

  const filenames = postFilePaths.map(name => name.replace(/\.mdx?$/, ''));

  const frontMatters = postFilePaths
    .map(name => path.join(POSTS_PATH, name))
    .map(fullName => fs.readFileSync(fullName))
    .map(content => matter(content).data);

  return {
    props: {
      filenames,
      frontMatters,
    },
  };
}

export default Index;
