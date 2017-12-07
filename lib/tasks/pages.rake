namespace :pages do

  desc "create page ideas and colaboration space"
  task create: :environment do
    SiteCustomization::Page.create(
      slug: "ideas",
      title: "IDEAS",
      content: "<p>La ciudad necesita de tus aportes ciudadanos para crecer. Si ten&eacute;s una idea para mejorar Montevideo, pr&oacute;ximamente podr&aacute;s&nbsp;plantearla para que la Intendencia la lleve a cabo.</p>\r\n",
      more_info_flag: false,
      print_content_flag: false,
      status: "published",
      locale: "es")
    SiteCustomization::Page.create(
      slug: "espacios-de-colaboracion",
      title: "ESPACIOS DE COLABORACIÓN",
      content: "<p>ENLACE</p>\r\n\r\n<p>Cowork p&uacute;blico que re&uacute;ne emprendimientos solidarios y&nbsp; organizaciones de la sociedad civil que se caracterizan por contribuir a la mejora de sus comunidades.</p>\r\n\r\n<p><strong>Mostrar m&aacute;s aqu&iacute;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>MONTEVIDEO LAB</p>\r\n\r\n<p>Espacio f&iacute;sico y digital dedicado a facilitar el intercambio, la interacci&oacute;n y la innovaci&oacute;n entre ciudadan&iacute;a y gobierno.&nbsp;</p>\r\n\r\n<p><strong>Mostrar m&aacute;s aqu&iacute;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>PROGRAMA MONTEVIDEO VOLUNTARIO</p>\r\n\r\n<p>Funciona como un espacio de participaci&oacute;n activa en los procesos de desarrollo del departamento, promoviendo la solidaridad e integraci&oacute;n ciudadana, bajo la regulaci&oacute;n de la Ley N&ordm; 17.885 de Voluntariado Social.&nbsp;</p>\r\n\r\n<p><strong>Mostrar m&aacute;s aqu&iacute;</strong></p>\r\n",
      more_info_flag: false,
      print_content_flag: false,
      status: "published",
      locale: "es")
  end

end
