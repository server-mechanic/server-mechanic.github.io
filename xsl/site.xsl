<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8" indent="yes" />

<xsl:template match="/site">
<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="icon" href="../../favicon.ico"/>
    <title>Server Mechanic - Server Evolution Made Easy</title>
    <link rel="stylesheet" href="assets/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/server-mechanic.css"/>
  </head>

  <body>
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
<a class="navbar-brand" href="/">
	<img id="logo" alt="Logo" src="assets/images/mechanic_logo.png"/>
      </a>
            </div>
          <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav nav-pills navbar-right">
            <xsl:for-each select="pages/page[@short-title!='']">
            <li class="nav-item">
              <a>
              <xsl:if test="./@path=$page">
              <xsl:attribute name="class">nav-link active</xsl:attribute>
              </xsl:if>
              <xsl:if test="./@path!=$page">
              <xsl:attribute name="class">nav-link</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href"><xsl:value-of select="./@path"/>.html</xsl:attribute>
              <xsl:value-of select="@short-title"/>
              </a>
            </li>
            </xsl:for-each>
          </ul>
        </div>
</nav>

      <xsl:apply-templates select="pages/page[@path=$page]"/>

      <footer class="footer row">
        <div class="col-md-6 col-lg-6">
        <p>Copyright &#169; 2016, 2017 by the Server Mechanic Team.</p>
        </div>
        <div class="col-md-4 col-lg-4">
        <p><a href="privacy.html">Privacy</a></p>
        </div>
        <div class="col-md-2 col-lg-2">
        <p class="pull-right">
          <a target="_blank" href="https://github.com/server-mechanic/mechanic">
<svg aria-hidden="true" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>
</a>
        </p>
        </div>
      </footer>

    </div> <!-- /container -->

    <script src="assets/jquery-1.12.1/jquery.min.js"></script>
    <script src="assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-91080667-1', 'auto');
  ga('send', 'pageview');
</script>
  </body>
</html>
</xsl:template>

<xsl:template match="page">
      <xsl:variable name="page-layout" select="pages/pages[@path=$page]/@layout"/>
      <a>
        <xsl:attribute name="id"><xsl:value-of select="@path"/></xsl:attribute>
      </a>
      <!--LAYOUT:[<xsl:value-of select="$page-layout"/>]-->
        <!--<h2><xsl:value-of select="@short-title"/></h2>-->
<xsl:apply-templates select="*"/>

      <div class="row">
        <div class="col-lg-12">
          For more information visit <a target="_blank" href="https://github.com/server-mechanic/mechanic">Server Mechanic project at github</a>.
        </div>
      </div>

</xsl:template>

<xsl:include href="./code.xsl"/>
<xsl:include href="./identity.xsl"/>
</xsl:stylesheet>
