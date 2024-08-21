<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:variable name="counter" select="0"/>


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

<xsl:variable name="PICKUP">
    <xsl:value-of select="notification_data/incoming_request/borrowing_library" />                                                   
 </xsl:variable>

 <xsl:variable name="PARTNER">
    <xsl:value-of select="notification_data/partner_name"/>
 </xsl:variable>
 
 <xsl:variable name="REQ_BAR">
    <xsl:value-of select="notification_data/incoming_request/requested_barcode" />                                                   
 </xsl:variable>

 <xsl:variable name="METADATA">
    <xsl:value-of select="notification_data/incoming_request/request_metadata" /> 
 </xsl:variable>

 <xsl:variable name="REQUESTED_BARCODE">
    <xsl:value-of select='substring-before(substring-after($METADATA,"dc:barcode>"),"&lt;/dc:")'/>                                            
 </xsl:variable>


<xsl:template name="id-info">
   <xsl:param name="line"/>
   <xsl:variable name="first" select="substring-before($line,'//')"/>
   <xsl:variable name="rest" select="substring-after($line,'//')"/>
    <xsl:if test="$first = '' and $rest = '' ">
          <!--br/-->
      </xsl:if>
   <xsl:if test="$rest != ''">
       <xsl:value-of select="$rest"/><br/>
   </xsl:if>
   <xsl:if test="$rest = ''">
       <xsl:value-of select="$line"/><br/>
   </xsl:if>

</xsl:template>

  <xsl:template name="id-info-hdr">
        <xsl:call-template name="id-info">
        	<xsl:if test="notification_data/incoming_request/rapidr_external_request_id!=''">
            	<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            </xsl:if>
        	<xsl:if test="notification_data/incoming_request/rapidr_external_request_id=''">
            	<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
            </xsl:if>
            <xsl:with-param name="label" select="'Bibliographic Information:'"/>
         </xsl:call-template>
</xsl:template>

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->


			<div class="messageArea">
				<div class="messageBody">
					 <table cellspacing="0" cellpadding="5" border="0">

						<tr>
							<td>
								<b>@@supplied_to@@: </b>
								<xsl:value-of select="notification_data/partner_name"/>
							</td>
						</tr>

			            <tr>
			                <td>
			                  <b>@@shipping_address@@: </b>
			                </td>
			            </tr>
			            
			            <xsl:if test="notification_data/incoming_request/borrowing_institution!=''">
                            <tr><td> <xsl:value-of select="notification_data/incoming_request/borrowing_institution"/></td></tr>
                        </xsl:if>

                        <xsl:if test="notification_data/incoming_request/borrowing_library!=''">
                           <tr><td> <xsl:value-of select="notification_data/incoming_request/borrowing_library"/></td></tr>
                        </xsl:if>

			            <xsl:for-each select="notification_data/partner_shipping_info_list/partner_shipping_info">
							<br></br>
							<table cellspacing="0" cellpadding="5" border="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
									<tr><td><xsl:value-of select="address1"/></td></tr>
									<tr><td><xsl:value-of select="address2"/></td></tr>
									<tr><td><xsl:value-of select="address4"/></td></tr>
									<tr><td><xsl:value-of select="address5"/></td></tr>
									<tr><td><xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/></td></tr>
									<tr><td><xsl:value-of select="state"/>&#160;<xsl:value-of select="country"/></td></tr>
							</table>
						</xsl:for-each>

					 <tr>
								<td><b>@@email@@: </b> <xsl:value-of select="notification_data/email"/></td>
					 </tr>
					 <tr>
								<td><b>@@phone@@: </b> <xsl:value-of select="notification_data/phone"/></td>
					 </tr>


				     <tr></tr>
				     <tr></tr>
				     <tr>
			                <td>
			                  <b>@@borrower_reference@@: </b>
			                   <xsl:call-template name="id-info-hdr"/>
			                </td>
			         </tr>

			          <tr>
							  <td><b>@@my_id@@: </b><img src="externalId.png" alt="externalId" /></td>
				      </tr>

				      <xsl:if  test="notification_data/qualifier != ''" >
					      <tr>
								  <td><b>@@qualifier@@: </b><img src="qualifier.png" alt="qualifier" /></td>
					      </tr>
				      </xsl:if>

				      <xsl:if  test="notification_data/group_qualifier != ''" >
					      <tr>
								  <td><b>@@group_qualifier@@: </b><img src="group_qualifier.png" alt="group_qualifier" /></td>
					      </tr>
				      </xsl:if>

						<tr>
							<td>
								<b>@@format@@: </b>
								<xsl:value-of select="notification_data/incoming_request/format"/>
							</td>
						</tr>

						<xsl:if  test="notification_data/incoming_request/needed_by_dummy/full_date" >
							<tr>
								<td>
									<b>@@date_needed_by@@: </b>
									<xsl:value-of select="notification_data/incoming_request/needed_by"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/note" >
							<tr>
								<td>
									<b>@@request_note@@: </b>
									<xsl:value-of select="notification_data/incoming_request/note"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/incoming_request/requester_email" >
							<tr>
								<td>
									<b>@@requester_email@@: </b>
									<xsl:value-of select="notification_data/incoming_request/requester_email"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/assignee != ''" >
							<tr>
								<td>
									<b>@@assignee@@: </b>
									<xsl:value-of select="notification_data/assignee"/>
								</td>
							</tr>
						</xsl:if>

						<xsl:if  test="notification_data/item">
							<br></br>

							<tr>
							  <td><b>@@item_barcode@@: </b><img src="Barcode1.png" alt="Barcode1" /></td>
							</tr>

							<tr>
								<td><xsl:value-of select="notification_data/item/title"/></td>
							</tr>

				      <xsl:if test="notification_data/item/issue_level_description !=''">
					<tr>
					  <td>
					    <b>Description:</b><xsl:value-of select="notification_data/item/issue_level_description"/>
					  </td>
					</tr>
				      </xsl:if>

							<tr>
								<td><xsl:value-of select="title"/></td>
							</tr>


							<tr>
								<td>
									<b>@@library@@: </b>
									<xsl:value-of select="notification_data/item/library_name"/>
								</td>
							</tr>

							<tr>
								<td><b>@@location@@: </b><xsl:value-of select="notification_data/item/location_name"/></td>
							</tr>

							<xsl:if  test="call_number" >
								<tr>
									<td><b>@@call_number@@: </b><xsl:value-of select="notification_data/item/call_number"/></td>
								</tr>
							</xsl:if>

							<xsl:if  test="volume" >
								<tr>
									<td><b>@@volume@@: </b><xsl:value-of select="volume"/></td>
								</tr>
						    </xsl:if>

						  <xsl:if  test="copy_id">
								<tr>
									<td><b>Copy ID:</b><xsl:value-of select="copy_id"/></td>
								</tr>
						  </xsl:if>

							<xsl:if  test="shelving_location/string" >
								<tr>
									<td><b>@@shelving_location_for_item@@: </b>
									 <xsl:for-each select="shelving_location/string">
										<xsl:value-of select="."/>
									 &#160;
									 </xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</xsl:if>

					</table>
				</div>
			</div>


<!-- footer.xsl -->
	    <!-- xsl:call-template name="reachoutSalutation" -->
	    <!-- xsl:call-template name="attentionSalutation" -->
	    <!-- xsl:call-template name="salutation" -->
	    <br />
	    <xsl:call-template name="last1Footer" />
	    <xsl:call-template name="last2Footer" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
