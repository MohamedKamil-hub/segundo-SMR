100-ACCLFO-20-LA-M04SG

<> of 86+-<->Cerrar

©

2022 Amazon Web

Services

, Inc. o sus empresas afiliadas. Todos los derechos reservados.

67

Protección

de buckets y

objetos

de Amazon S3

•

Los

buckets

y objetos de S3 recientemente creados son

privados

y están

protegidos

de forma predeterminada.

•

Cuando los casos de uso requieren compartir objetos de datos en Amazon S3:

•

Es fundamental administrar y controlar el acceso a los datos.

•

Siga los

permisos que siguen el principio de privilegio mínimo

y considere la posibilidad de

utilizar el cifrado de Amazon S3.

•

Entre las herramientas y opciones para controlar el acceso a los datos de S3 se

incluyen las siguientes:

•

Característica de Amazon S3 Block Public Access

: es fácil de usar.

•

Políticas de IAM: son una buena opción cuando el usuario puede autenticarse con IAM.

•

Políticas de buckets

•

Listas de control de acceso

(ACL): son un mecanismo de control de acceso heredado.

•

Comprobación de permisos del

bucket

de

AWS Trusted Advisor

: es una característica gratuita.

De forma predeterminada, todos los

buckets

de Amazon S3 son privados y

solo

pueden

acceder los usuarios a los que se les concede acceso explícitamente. Es fundamental

administrar y controlar el acceso a los datos de Amazon S3. AWS proporciona muchas

herramientas y opciones para controlar el acceso a sus

buckets

u objetos de S3, entre

los que se incluyen los siguientes:

•

El uso de

Amazon S3 Block

Public

Access.

Esta configuración anula cualquier otra

política o permisos de objetos. Habilite

Block

Public

Access

para todos los

buckets

que no desee que sean accesibles públicamente. Esta característica proporciona un

método sencillo para evitar la exposición no deseada de datos de Amazon S3.

•

La escritura de

políticas de IAM

que especifiquen los usuarios o roles que pueden

obtener acceso a

buckets

y objetos específicos. Este método se ha tratado en detalle

anteriormente en este módulo.

•

La escritura de

políticas de

bucket

que definan el acceso a

buckets

u objetos

específicos. Esta opción se suele utilizar cuando el usuario o el sistema no pueden

autenticarse mediante IAM. Las políticas de

bucket

se pueden configurar para

conceder acceso entre cuentas de AWS o para conceder acceso público o anónimo a

los datos de Amazon S3. Si se utilizan políticas de

bucket

, deben escribirse

detenidamente y probarse en su totalidad. Puede especificar una instrucción de

AWS Training and Certification

Módulo 4: Seguridad en la nube de AWS

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

72

[](https://aws.amazon.com/blogs/aws/amazon-s3-block-public-access-another-layer-of-protection-for-your-accounts-and-buckets/ "https://aws.amazon.com/blogs/aws/amazon-s3-block-public-access-another-layer-of-protection-for-your-accounts-and-buckets/")

[](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html "https://docs.aws.amazon.com/AmazonS3/latest/dev/using-iam-policies.html")

[](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html "https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html")

[](https://aws.amazon.com/premiumsupport/trustedadvisor/ "https://aws.amazon.com/premiumsupport/trustedadvisor/")

[](https://aws.amazon.com/compliance/programs/ "https://aws.amazon.com/compliance/programs/")

[](https://aws.amazon.com/compliance/services-in-scope/ "https://aws.amazon.com/compliance/services-in-scope/")

[](https://aws.amazon.com/compliance/gdpr-center/ "https://aws.amazon.com/compliance/gdpr-center/")

©

2022 Amazon Web

Services

, Inc. o sus empresas afiliadas. Todos los derechos reservados.

71

AWS Artifact

•

Es un recurso destinado a la información relacionada con la

conformidad.

•

Proporciona acceso a informes de seguridad y conformidad, así

como también a acuerdos en línea seleccionados.

•

Puede obtener acceso a descargas de ejemplo:

•

Certificaciones ISO de AWS

•

Informes del sector de tarjetas de pago (PCI) y del control de organizaciones de

servicios (SOC)

•

Puede acceder a AWS

Artifact

directamente desde la consola de

administración de AWS

•

En

Security,

Identify

&

Compliance

(Seguridad, identidad y conformidad),

haga clic en

Artifact

.

AWS Artifact

AWS

Artifact

proporciona descargas bajo demanda de documentos de seguridad y

conformidad de AWS, como certificaciones ISO de AWS e informes del sector de

tarjetas de pago (PCI) y del control de organizaciones de servicios (SOC). Puede enviar

los documentos de seguridad y conformidad (también conocidos como

artefactos de

auditoría

) a sus auditores o reguladores para demostrar la seguridad y el cumplimiento

de la infraestructura y los servicios de AWS que utiliza. También puede usar estos

documentos como directrices para evaluar su propia arquitectura en la nube y evaluar

la efectividad de los controles internos de su empresa. AWS

Artifact

solo proporciona

documentos sobre AWS. Los clientes de AWS son los responsables de desarrollar u

obtener documentos que demuestren la seguridad y la conformidad de sus empresas.

Puede utilizar AWS

Artifact

para revisar, aceptar y realizar un seguimiento del estado

de los acuerdos de AWS, como el Acuerdo para socio empresarial (BAA). Un BAA suele

ser necesario para las empresas sujetas al HIPAA a fin de garantizar la protección

adecuada de la información sanitaria protegida (PHI). Con AWS

Artifact

, puede aceptar

los acuerdos con AWS; y designar cuentas de AWS que puedan procesar legalmente

información restringida. Puede aceptar un acuerdo en nombre de varias cuentas. Para

aceptar acuerdos de varias cuentas, cree una organización con AWS

Organizations

.

Para obtener más información, consulte

Administración de sus acuerdos en AWS

Artifact

.

AWS Training and Certification

Módulo 4: Seguridad en la nube de AWS

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

78

[](https://docs.aws.amazon.com/artifact/latest/ug/managingagreements.html "https://docs.aws.amazon.com/artifact/latest/ug/managingagreements.html")

© 2022, Amazon Web Services, Inc. or its affiliates. All rights reserved.

80

Respuesta a la pregunta de examen de ejemplo

¿Cuál de las siguientes opciones es responsabilidad de AWS en virtud del

Modelo del responsabilidad compartida de AWS?

Las palabras clave de la pregunta son “responsabilidad de WS” y “modelo de responsabilidad

compartida de WS”.

La respuesta correcta es la B.

Las siguientes son las palabras clave que se deben reconocer:

“Responsabilidad de AWS” y

“Modelo de responsabilidad compartida de AWS”.

La respuesta correcta es la B.

Este ejemplo de pregunta de examen proviene del documento de preguntas de ejemplo de AWS

Certified Cloud Practitioner al que se puede acceder desde la página principal

de información del

examen AWS Certified Cloud Practitioner en

https://aws.amazon.com/certification/certified

-

cloud

-

practitioner/

.

AWS Training and Certification

Módulo 4: Seguridad en la nube de AWS

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

84

[](https://aws.amazon.com/certification/certified-cloud-practitioner/ "https://aws.amazon.com/certification/certified-cloud-practitioner/")

©

2022 Amazon Web

Services

, Inc. o sus empresas afiliadas. Todos los derechos reservados.

81

Recursos adicionales

•

Página

de

inicio

de

Seguridad

en

la

nube

de AWS:

https://aws.amazon.com/security/

•

Recursos

de

seguridad

de AWS:

https://aws.amazon.com/security/security

-

learning/?cards

-

top.sort

-

by=item.additionalFields.sortDate&cards

-

top.sort

-

order=desc&awsf.Types=*all

•

Blog de

seguridad

de AWS:

https://aws.amazon.com/blogs/security/

•

Boletines

de

seguridad

:

https://aws.amazon.com/security/security

-

bulletins/?card

-

body.sort

-

by=item.additionalFields.bulletinId&card

-

body.sort

-

order=desc&awsf.bulletins

-

flag=*all&awsf.bulletins

-

year=*all

•

Pruebas

de

intrusión

y

vulnerabilidad

:

https://aws.amazon.com/security/penetration

-

testing/

•

Marco de Buena

Arquitectura

de AWS: pilar de

seguridad

:

https://d1.awsstatic.com/whitepapers/architecture/AWS

-

Security

-

Pillar.pdf

•

Documentación

de AWS:

prácticas

recomendadas

de IAM:

https://docs.aws.amazon.com/IAM/latest/UserGuide/best

-

practices.html

•

Página

de

inicio

de

Seguridad

en

la

nube

de AWS:

https://aws.amazon.com/security/

•

Recursos

de

seguridad

de AWS:

https://aws.amazon.com/security/security

-

learning/?cards

-

top.sort

-

by=item.additionalFields.sortDate&cards

-

top.sort

-

order=desc&awsf.Types=*all

•

Blog de

seguridad

de AWS:

https://aws.amazon.com/blogs/security/

•

Boletines

de

seguridad

:

https://aws.amazon.com/security/security

-

bulletins/?card

-

body.sort

-

by=item.additionalFields.bulletinId&card

-

body.sort

-

order=desc&awsf.bulletins

-

flag=*all&awsf.bulletins

-

year=*all

•

Pruebas

de

intrusión

y

vulnerabilidad

:

https://aws.amazon.com/security/penetration

-

testing/

•

Marco de Buena

Arquitectura

de AWS: pilar de

seguridad

:

https://d1.awsstatic.com/whitepapers/architecture/AWS

-

Security

-

Pillar.pdf

•

Documentación

de AWS:

prácticas

recomendadas

de IAM:

https://docs.aws.amazon.com/IAM/latest/UserGuide/best

-

practices.html

AWS Training and Certification

Módulo 4: Seguridad en la nube de AWS

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

85

[](https://aws.amazon.com/security/ "https://aws.amazon.com/security/")

[](https://aws.amazon.com/security/security-learning/?cards-top.sort-by=item.additionalFields.sortDate&cards-top.sort-order=desc&awsf.Types=*all "https://aws.amazon.com/security/security-learning/?cards-top.sort-by=item.additionalFields.sortDate&cards-top.sort-order=desc&awsf.Types=*all")

[](https://aws.amazon.com/blogs/security/ "https://aws.amazon.com/blogs/security/")

[](https://aws.amazon.com/security/security-bulletins/?card-body.sort-by=item.additionalFields.bulletinId&card-body.sort-order=desc&awsf.bulletins-flag=*all&awsf.bulletins-year=*all "https://aws.amazon.com/security/security-bulletins/?card-body.sort-by=item.additionalFields.bulletinId&card-body.sort-order=desc&awsf.bulletins-flag=*all&awsf.bulletins-year=*all")

[](https://aws.amazon.com/security/penetration-testing/ "https://aws.amazon.com/security/penetration-testing/")

[](https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf "https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf")

[](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html "https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html")

[](https://aws.amazon.com/security/ "https://aws.amazon.com/security/")

[](https://aws.amazon.com/security/security-learning/?cards-top.sort-by=item.additionalFields.sortDate&cards-top.sort-order=desc&awsf.Types=*all "https://aws.amazon.com/security/security-learning/?cards-top.sort-by=item.additionalFields.sortDate&cards-top.sort-order=desc&awsf.Types=*all")

[](https://aws.amazon.com/blogs/security/ "https://aws.amazon.com/blogs/security/")

[](https://aws.amazon.com/security/security-bulletins/?card-body.sort-by=item.additionalFields.bulletinId&card-body.sort-order=desc&awsf.bulletins-flag=*all&awsf.bulletins-year=*all "https://aws.amazon.com/security/security-bulletins/?card-body.sort-by=item.additionalFields.bulletinId&card-body.sort-order=desc&awsf.bulletins-flag=*all&awsf.bulletins-year=*all")

[](https://aws.amazon.com/security/penetration-testing/ "https://aws.amazon.com/security/penetration-testing/")

[](https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf "https://d1.awsstatic.com/whitepapers/architecture/AWS-Security-Pillar.pdf")

[](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html "https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html")

©

2022 Amazon Web

Services

, Inc. o sus empresas afiliadas. Todos los derechos reservados.

82

Gracias

Todas

las

marcas

comerciales

pertenecen

a sus

propietarios

.

Gracias por completar este módulo.

AWS Training and Certification

Módulo 4: Seguridad en la nube de AWS

© 2024, Amazon Web Services, Inc. o sus filiales. Todos los derechos reservados.

86