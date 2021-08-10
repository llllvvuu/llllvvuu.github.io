let gaTrackingId = "G-C9LL5WYTVN"

@react.component
let make = (~title, ~description) => {
  <>
    <Next.Head>
      <title>{title->React.string}</title>
      <meta charSet="utf-8" />
      <link rel="shortcut icon" href="/favicon.ico" />
      <meta name="description" content={description} />
      <meta name="twitter:card" content="summary_large_image" />
      <meta name="twitter:creator" content="@llllvvuu" />
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:type" content="website" />
      <script defer=true src="/instantpage.js"></script>
      <script defer=true src="https://www.googletagmanager.com/gtag/js?id=G-MBWQ2DW007"></script>
      <script dangerouslySetInnerHTML={{
        "__html": `window.dataLayer = window.dataLayer || [];
function gtag(){dataLayer.push(arguments);}
gtag('js', new Date());
gtag('config', '${gaTrackingId}');`
      }} />
    </Next.Head>
  </>
}
