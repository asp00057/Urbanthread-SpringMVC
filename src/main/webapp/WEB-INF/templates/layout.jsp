<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="jakarta.faces.html"
      xmlns:ui="jakarta.faces.facelets">
<h:head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><ui:insert name="titulo"><ui:insert name="title">Urban Thread</ui:insert></ui:insert></title>
    <h:outputStylesheet name="primeicons/primeicons.css" library="primefaces"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <link rel="icon" type="image/jpeg" href="#{resource['Images:logo.jpeg']}" />
    <ui:insert name="head-extra"/>
</h:head>

<h:body style="background-color: #{preferencias.color}; transition: background-color 0.3s ease;">
    <ui:include src="/WEB-INF/fragments/header.xhtml"/>

    <main class="container mt-4" style="min-height: 80vh;">
        <ui:insert name="contenido"/>
    </main>

    <ui:include src="/WEB-INF/fragments/footer.xhtml"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3/dist/js/bootstrap.bundle.min.js"></script>
</h:body>
</html>