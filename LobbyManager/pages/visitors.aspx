﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Main.Master" AutoEventWireup="true" CodeBehind="visitors.aspx.cs" Inherits="LobbyManager.pages.visitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function registerEQ() {
            if ((<%= addEQ.ToString().ToLower() %>))
            {
                window.location="equipment_form.aspx?visitor=<%= visitor.ToString().ToLower() %>";
            }
        }
        onload=registerEQ();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainHolder" runat="server">
    <form role="form" runat="server">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Registro de Visitantes</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Formulario para Visitantes
                    </div>
                    <div class="panel-body">
                        <div class="row" runat="server" id="images">
                            <div class="col-lg-6">
                                <img runat="server" id="img_front" class="img-responsive" src="~/images/sykeslogo.png" />
                            </div>
                            <div class="col-lg-6">
                                <img runat="server" id="img_back" class="img-responsive" src="~/images/sykeslogo.png" />
                            </div>
                        </div>
                        <div class="alert alert-warning" id="msgWarn" runat="server">
                                Sus datos no han sido procesados correctamente, <a data-toggle="modal" href="#imagesDlg" class="alert-link">Reintentar</a></div>
                        <div class="row">
                            <div class="col-lg-6">
                                <fieldset id="fs_images" runat="server">
                                    <div class="col-lg-12 col-md-6">
                                        <div class="panel panel-yellow">
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-xs-2">
                                                        <i class="fa fa-arrow-circle-o-right fa-5x"></i>
                                                    </div>
                                                    <div class="col-xs-9 text-center">
                                                        <div class="h2">
                                                            Seleccione un Tipo de Documento
                                                        </div>
                                                        <div class="huge">
                                                            <asp:DropDownList runat="server" ID="docTypeSelect" class="form-control"
                                                                DataSourceID="SqlDataSourceDocuments" DataValueField="doc_id" DataTextField="doc_name">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <a data-toggle="modal" href="#imagesDlg">
                                        <div class="col-lg-12 col-md-6">
                                            <div class="panel panel-green">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-2">
                                                            <i class="fa fa-arrow-circle-o-right fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-center">
                                                            <div class="huge">
                                                                <asp:Label ID="lbl_newCommentsCount" runat="server" Text="Importar imágenes"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>

                                    <a data-toggle="modal" href="#noDocDlg">
                                        <div class="col-lg-12 col-md-6">
                                            <div class="panel panel-red">
                                                <div class="panel-heading">
                                                    <div class="row">
                                                        <div class="col-xs-2">
                                                            <i class="fa fa-arrow-circle-o-right fa-5x"></i>
                                                        </div>
                                                        <div class="col-xs-9 text-center">
                                                            <div class="huge">
                                                                <asp:Label ID="Label1" runat="server" Text="No tengo documento"></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </fieldset>
                                <fieldset id="fs_personalData" runat="server">
                                    <h3>Datos Personales</h3>
                                    <div class="form-group">
                                        <label>Nombres</label>
                                        <input runat="server" id="txt_name" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>Apellidos</label>
                                        <input runat="server" id="txt_lastname" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>No. de Documento</label>
                                        <input runat="server" id="txt_docnumber" class="form-control" placeholder="12345678-9" />
                                    </div>
                                    <div class="form-group">
                                        <label>Empresa</label>
                                        <input runat="server" id="txt_company" class="form-control" />
                                        <p class="help-block">Si es particular, dejar vacío.</p>
                                    </div>
                                    <div class="form-group">
                                        <label>Teléfono de Contacto</label>
                                        <input runat="server" id="txt_phone" class="form-control" placeholder="(503)2222-2222" />
                                    </div>
                                    <div class="form-group">
                                        <label>Fecha de Ingreso</label>
                                        <p runat="server" id="lbl_date" class="form-control-static"><%= DateTime.Now.ToLocalTime() %></p>
                                    </div>
                                </fieldset>
                            </div>
                            <!-- /.col-lg-6 (nested) -->
                            <div class="col-lg-6">
                                <fieldset id="fs_visitDetails" runat="server">
                                    <h3>Detalle de la Visita</h3>
                                    <div class="form-group">
                                        <label for="reasonSelect">Motivo</label>
                                        <asp:DropDownList runat="server" ID="reasonSelect" class="form-control"
                                            DataSourceID="SqlDataSourceReasons" DataValueField="vrs_id" DataTextField="vrs_name">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="descriptionText">Descripción</label>
                                        <textarea class="form-control" runat="server" id="txt_description" placeholder="Objetivo de la visita" />
                                    </div>
                                    <div class="form-group">
                                        <label for="deptSelect">Departamento</label>
                                        <asp:DropDownList runat="server" ID="deptSelect" class="form-control"
                                            DataSourceID="SqlDataSourceDepartments" DataValueField="dep_id" DataTextField="dep_name">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="contactText">Contacto</label>
                                        <input runat="server" class="form-control" id="txt_contact" type="text" placeholder="Nombre del contacto interno" />
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input runat="server" id="chk_addEQ" type="checkbox" />Ingresa equipo
                                        </label>
                                    </div>
                                    <asp:Button runat="server" class="btn btn-primary" OnClick="InsertVisitor" Text="Aceptar"></asp:Button>
                                    <button type="reset" class="btn btn-default">Cancelar</button>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="noDocDlg" tabindex="-1" role="dialog" aria-labelledby="noDocModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="noDocModalLabel">Continuar sin documento</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Demostración
                            </div>
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    Ésta modalidad es únicamente para fines de prueba.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-primary" runat="server" Text="Continuar" OnClick="NoDocumentDemo" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="imagesDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Importar desde escáner</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Imágenes disponibles
                            </div>
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    Por favor, haga el escaneo del documento antes de contniuar.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-primary" runat="server" Text="Importar imágenes" OnClick="ImportImages" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="completeDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Registro finalizado</h4>
                    </div>
                    <div class="modal-body">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Registro finalizado
                            </div>
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    Se han registrado sus datos exitosamente.
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-primary" runat="server" Text="Aceptar" data-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSourceDocuments" runat="server"
            ConnectionString="<%$ ConnectionStrings:SykesVisitorsDB %>"
            SelectCommand="SELECT doc_id, doc_name FROM [tbl_doc_documents] WHERE doc_status = 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceReasons" runat="server"
            ConnectionString="<%$ ConnectionStrings:SykesVisitorsDB %>"
            SelectCommand="SELECT vrs_id, vrs_name FROM [tbl_vrs_visit_reasons] WHERE vrs_status = 1 AND vrs_level >= 2"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDepartments" runat="server"
            ConnectionString="<%$ ConnectionStrings:SykesVisitorsDB %>"
            SelectCommand="SELECT dep_id, dep_name FROM [tbl_dep_departments] WHERE dep_status = 1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceComments" runat="server"
            ConnectionString="<%$ ConnectionStrings:SykesVisitorsDB %>"
            SelectCommand="SELECT TOP 5 CONVERT(VARCHAR(8), com_date, 3) AS com_date,com_user,com_description FROM [tbl_com_comments]"></asp:SqlDataSource>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script type="text/javascript">
        $(function () {
            //alert("Working...");
            if (<%= showMg.ToString().ToLower() %>) showMsg();
        });
        function showMsg() {
            $('#completeDlg').modal('show');
        }
    </script>
</asp:Content>
