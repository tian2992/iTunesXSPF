<?xml version="1.0"?>
<!-- iTunesXSPF, by Sebastian Oliva (tian@sebastianoliva.com) [http://sebastianoliva.com]
Copyright (C) 2009,2010 Sebastian Oliva
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.
 
You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/">
		<playlist xmlns="http://xspf.org/ns/0/" version="1">
		  <!-- Add your Own Info Here -->
			<title>Playlist</title>
			<creator>Me</creator>
			<info>http://example.com/</info>
			<!-- Editing Further is unsafe -->
			<trackList>
				<xsl:for-each select="plist/dict/array/dict/array/dict">
					<xsl:variable name="Traki"><xsl:apply-templates select="key[. = 'Track ID']" mode="content"/></xsl:variable>
					<xsl:for-each select="/plist/dict/dict/dict">
						<xsl:if test="key[. = 'Track ID']/following-sibling::*/text() = $Traki">
							<track>
								<title><xsl:apply-templates select="key[. = 'Name']" mode="content"/></title>
								<creator><xsl:apply-templates select="key[. = 'Artist']" mode="content"/></creator>
								<album><xsl:apply-templates select="key[. = 'Album']" mode="content"/></album>
								<location><xsl:apply-templates select="key[. = 'Location']" mode="content"/></location>
								<annotation><xsl:apply-templates select="key[. = 'Comments']" mode="content"/></annotation>
								<duration><xsl:apply-templates select="key[. = 'Total Time']" mode="content"/></duration>
							</track>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</trackList>
		</playlist>
	</xsl:template>
 
	<xsl:template match="key" mode="content">
		<xsl:value-of select="following-sibling::*/text()"/>
	</xsl:template>
	<xsl:template match="trim" mode="content">
		<xsl:value-of select="following-sibling::*/text()"/>
	</xsl:template>
</xsl:stylesheet>
