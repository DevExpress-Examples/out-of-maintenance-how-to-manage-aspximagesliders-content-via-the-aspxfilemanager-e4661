<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="DevExpress.ImageManagement.Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFileManager" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxImageSlider" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDocking" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to manage ASPxImageSlider content via the ASPxFileManager</title>
</head>
<body>
	<script type="text/javascript">

		function UpdateSet() {
			filemanager.MOCPupdate = 1;
		}

		function UpdateReset() {
			if (filemanager.MOCPupdate) {
				filemanager.MOCPupdate = undefined;
				callbackPanel.PerformCallback();
			}
			popup.Hide();
		}

	</script>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxButton ID="btnBrowse" runat="server" Text="Manage images" AutoPostBack="false">
			<ClientSideEvents Click="function() { popup.Show(); }" />
		</dx:ASPxButton>
		<dx:ASPxCallbackPanel ID="callbackPanel" runat="server" Width="800px" ClientInstanceName="callbackPanel">
			<PanelCollection>
				<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxImageSlider ID="imageSlider" runat="server" ImageSourceFolder="~\Images\" Width="100%">
					</dx:ASPxImageSlider>
				</dx:PanelContent>
			</PanelCollection>
		</dx:ASPxCallbackPanel>
	</div>
		<dx:ASPxPopupControl ID="popup" runat="server" ShowFooter="true" HeaderText="Select file" EnableClientSideAPI="true" ClientInstanceName="popup" ShowCloseButton="false">
			<ContentCollection>
				<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxFileManager ID="filemanager" runat="server" Width="800px" ClientInstanceName="filemanager">
						<settings rootfolder="~\Images\" thumbnailfolder="~\Thumb\" AllowedFileExtensions=".jpeg, .jpg"/>
						<SettingsUpload AllowedFolderPath="~\Images\" UseAdvancedUploadMode="true"/>
						<SettingsEditing AllowDelete="true" AllowRename="true" />
						<ClientSideEvents FileUploaded="UpdateSet" ItemDeleted="UpdateSet" />
					</dx:ASPxFileManager>
				</dx:PopupControlContentControl>
			</ContentCollection>
			<FooterTemplate>
				<table>
					<tr>
						<td style="width:100%"></td>
						<td>
							<dx:ASPxButton ID="btnOk" runat="server" Text="OK" AutoPostBack="false" Width="75px">
								<ClientSideEvents Click="UpdateReset" />
							</dx:ASPxButton>
						</td>
					</tr>
				</table>
			</FooterTemplate>
		</dx:ASPxPopupControl>
	</form>
</body>
</html>