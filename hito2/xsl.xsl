<!-- ecommerce.xsl -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Template para el elemento 'ecommerce' -->
  <xsl:template match="ecommerce">
    <html>
      <head>
        <title>Tabla de Pedidos</title>
      </head>
      <body>
        <h1>Pedidos de E-commerce</h1>
        <table border="1">
          <tr>
            <th>Año</th>
            <th>Trimestre</th>
            <th>Fecha de Compra</th>
            <th>Fecha de Entrega</th>
            <th>Número de Pedido</th>
            <th>Total</th>
            <th>Cliente</th>
            <th>Detalles del Producto</th>
          </tr>
          <xsl:apply-templates select="ano/trimestre/pedido"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <!-- Template para el elemento 'pedido' -->
  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="../@year"/></td>
      <td><xsl:value-of select="../@num"/></td>
      <td><xsl:value-of select="@fechaCompra"/></td>
      <td><xsl:value-of select="@fechaEntrega"/></td>
      <td><xsl:value-of select="@num"/></td>
      <td><xsl:value-of select="@total"/></td>
      <td><xsl:value-of select="cliente"/></td>
      <td>
        <xsl:apply-templates select="detalles/producto"/>
      </td>
    </tr>
  </xsl:template>

  <!-- Template para el elemento 'producto' -->
  <xsl:template match="producto">
    <p><xsl:value-of select="@nombre"/> - <xsl:value-of select="@precio"/> - <xsl:value-of select="@referencia"/> - <xsl:value-of select="@unidades"/></p>
  </xsl:template>

</xsl:stylesheet>


