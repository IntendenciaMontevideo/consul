Rails.application.config.middleware.use OmniAuth::Builder do
  provider :saml,
           #:assertion_consumer_service_url     => "consumer_service_url",
           issuer:                              "localhost.participa.montevideo.gub.uy",
           idp_entity_id:                       "ihdesa.imm.gub.uy",
           idp_sso_target_url:                  "https://ihdesa.imm.gub.uy:9443/samlsso",
           idp_slo_target_url:                  "https://ihdesa.imm.gub.uy:9443/samlsso",
           idp_cert:                            "-----BEGIN CERTIFICATE-----
MIICNTCCAZ6gAwIBAgIES343gjANBgkqhkiG9w0BAQUFADBVMQswCQYDVQQGEwJVUzELMAkGA1UE
CAwCQ0ExFjAUBgNVBAcMDU1vdW50YWluIFZpZXcxDTALBgNVBAoMBFdTTzIxEjAQBgNVBAMMCWxv
Y2FsaG9zdDAeFw0xMDAyMTkwNzAyMjZaFw0zNTAyMTMwNzAyMjZaMFUxCzAJBgNVBAYTAlVTMQsw
CQYDVQQIDAJDQTEWMBQGA1UEBwwNTW91bnRhaW4gVmlldzENMAsGA1UECgwEV1NPMjESMBAGA1UE
AwwJbG9jYWxob3N0MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCUp/oV1vWc8/TkQSiAvTou
sMzOM4asB2iltr2QKozni5aVFu818MpOLZIr8LMnTzWllJvvaA5RAAdpbECb+48FjbBe0hseUdN5
HpwvnH/DW8ZccGvk53I6Orq7hLCv1ZHtuOCokghz/ATrhyPq+QktMfXnRS4HrKGJTzxaCcU7OQID
AQABoxIwEDAOBgNVHQ8BAf8EBAMCBPAwDQYJKoZIhvcNAQEFBQADgYEAW5wPR7cr1LAdq+IrR44i
QlRG5ITCZXY9hI0PygLP2rHANh+PYfTmxbuOnykNGyhM6FjFLbW2uZHQTY1jMrPprjOrmyK5sjJR
O4d1DeGHT/YnIjs9JogRKv4XHECwLtIVdAbIdWHEtVZJyMSktcyysFcvuhPQK8Qc/E/Wq8uHSCo=
-----END CERTIFICATE-----",
           name_identifier_format:              "urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified",
           private_key:                         "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAwExOiuIA1Jmjsr4nzAAgix708hlTayvBSz41cIMwz3F162AM\nkNxZYFdCUraZ7a1tj5/tEj1tXEH+uqTxXhoPsPKOVVc+/4QseKF81pv/jhNojvjI\n9WTfaaFjo6C7GLx1nMxGSESWI6Z6rbCY8u8vs3U+zgUsW/PFPwleZqMZE7lZ+5Xs\nQEcEQ4Vica4rzOmFVXM0qs+vXyMNIQ05XSZ8pjCJBR9B9Rd/UzojzTr352D9y3+T\nRUZvbHUP9jT+QtrmJh83xQDNBCpZqmWurCcLkFWwngXTYP7v+qasza88D3mcjPps\nW6fLalKytl1KX6/KUCKHD15HvScCC2KwJjQCiwIDAQABAoIBACBbtsvABAvCXr1x\nKhk13EQMzYL/p/3cuwYCTdPE/62olgMpgnPN4GxJwqtQds575HfKnYX4ODLSGB8o\nKkV/dSx9ZF4P9FXi0+joo60pSvOJaIrGamqAsud/dNjP7yvWaqQb66e1gt404Wfg\n05vti8VS8WKRlElU19gnp271+v5KYu0R0d6/lplRmxRHnpBO42xVQrSS7h3I78nZ\nHahcXE8s2fV2c/A9d8iNAkEs4Ff3eQlH7pbINMIpsW1Ke7GGVtPs4DMEizypyjlV\n0LnngYYt5cOnYP3C4/CmQKA/Zw3EsGH+njM4xvyqhPQItvfAWhKVw+UJN0AwLXdl\nY33Eu+ECgYEA/pNrxXdKq3BlHHxmRgMKwTa6kMSwxZhg5HX6VoVZOKJHvz7/ajNy\nk8ZrKJIgl0GkJdGyWP2wvFwOkmQhBm/cvjLAC7NX2hUmJ4RN47j6BLf7kNZ+FW4V\ntYryQrejnudFN92ZAtOPdjZsrzBj5PAUK8FY7ylMdRwufQ39M4Q8KDUCgYEAwV+y\nlFccuNC1BFvqU7rjCyv7y+BrLVugUsJzvrAy7QV1/l5lc4D8HCixY3Sxaqf4btjQ\n2hy2xC/p+2mArYpVVpqcFPNfQ1FTVXQuxdlzJStgoBGCP6PlAqQ1o2mFXMgbLgY5\nBBd8eLuGJnhg88Vr2YuKlJVyMvquedtwMOIIV78CgYAjtLmg8KJgeVs1K52MpFCV\n2P9B3tSMYlr0sDd0ey+QafJ2OHfKhXzEjUfqYNSBYouLYmYJZUusn5zLm4+mP3pO\nkv+spHLl+6FmWYAzOHaYwtVd8zer+czBscNY6DjiyL1EoKgdZV7xzaBg0gCw05uA\np5W5takro9BBafzhhOKLIQKBgAvchuO6hDSB+NiPmswQBqVEyWk0Ft7tY+QvsVHd\nFQKc9yPnPmnbW5uOk3L6UXetXfvOqOD4Ke3W0o9tZUs/1QQ+75wJYaqLboUrX0Mb\nl4iMJJ0s9cRZlU6YLAIeEuQiEii8kPrDRgtR1WS+tZO+ZGMvwAxlLmAaKGGpKDSX\naNOZAoGBAJLNwgSDtUbjakZA5sBOPRKhuEYK57Fm5XO7xg5oO5iCLsPTKtEH8h1A\nVtylQwWDF9J0WsU2Ifeizz+tCIrGP7PS6t/rzIS71PhPrJFbRwEADhL0Puhp/78E\ngP5B4Vl3VsWKA+CEn8Xl93woIOZkHAd3szFQ12oQRUVylY8csTmZ\n-----END RSA PRIVATE KEY-----",
           certificate:                         "-----BEGIN CERTIFICATE-----\nMIIEVDCCAzygAwIBAgIJAKHue+gh0desMA0GCSqGSIb3DQEBBQUAMHkxCzAJBgNV\nBAYTAlVZMRMwEQYDVQQIEwpNb250ZXZpZGVvMRMwEQYDVQQHEwpNb250ZXZpZGVv\nMQwwCgYDVQQKEwNJTU0xDDAKBgNVBAsTA0dUSTEkMCIGA1UEAxMbcGFydGljaXBh\nLm1vbnRldmlkZW8uZ3ViLnV5MB4XDTE3MTEyMTE4MTU0MVoXDTI3MTEyMTE4MTU0\nMVoweTELMAkGA1UEBhMCVVkxEzARBgNVBAgTCk1vbnRldmlkZW8xEzARBgNVBAcT\nCk1vbnRldmlkZW8xDDAKBgNVBAoTA0lNTTEMMAoGA1UECxMDR1RJMSQwIgYDVQQD\nExtwYXJ0aWNpcGEubW9udGV2aWRlby5ndWIudXkwggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQDATE6K4gDUmaOyvifMACCLHvTyGVNrK8FLPjVwgzDPcXXr\nYAyQ3FlgV0JStpntrW2Pn+0SPW1cQf66pPFeGg+w8o5VVz7/hCx4oXzWm/+OE2iO\n+Mj1ZN9poWOjoLsYvHWczEZIRJYjpnqtsJjy7y+zdT7OBSxb88U/CV5moxkTuVn7\nlexARwRDhWJxrivM6YVVczSqz69fIw0hDTldJnymMIkFH0H1F39TOiPNOvfnYP3L\nf5NFRm9sdQ/2NP5C2uYmHzfFAM0EKlmqZa6sJwuQVbCeBdNg/u/6pqzNrzwPeZyM\n+mxbp8tqUrK2XUpfr8pQIocPXke9JwILYrAmNAKLAgMBAAGjgd4wgdswHQYDVR0O\nBBYEFJtJmhNY6QJiDtN5gMpD5qdU04ybMIGrBgNVHSMEgaMwgaCAFJtJmhNY6QJi\nDtN5gMpD5qdU04yboX2kezB5MQswCQYDVQQGEwJVWTETMBEGA1UECBMKTW9udGV2\naWRlbzETMBEGA1UEBxMKTW9udGV2aWRlbzEMMAoGA1UEChMDSU1NMQwwCgYDVQQL\nEwNHVEkxJDAiBgNVBAMTG3BhcnRpY2lwYS5tb250ZXZpZGVvLmd1Yi51eYIJAKHu\ne+gh0desMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggEBAGV47yAJCQJP\nZCmM3KP8A8cIX9sIzwrfjyeZpkt4sphbLVleyd6yZ3F1dRckgxIAlaHZtu52kFPW\n/Ytwj34x5AFzGM12TQU/G7WAgZpPGwKaP7v2NEDWm9Jb2AQcv540Zvipy4NrA/PX\na8u7GSICH+VCuHGKERa7kadV/rXwWiTa1SxVkss5rSSllz9UNH07LJaiYDCSdUdw\niN8eSVDmP1lc+07b/XMuq2ysojsp33T58cAu1Sm7RK1axadSu3LaDjuZmjQu2GYo\nw5I0dhtWIyX6gLlATi/PbZElnpKAf6fTXdbw9mV4Ure/wUj9i9Ea0krGSaFpndfH\nkTuYu8sCGTs=\n-----END CERTIFICATE-----",
           security:                            {
                                                  :authn_requests_signed      => true,
                                                  :logout_requests_signed     => false,
                                                  :logout_responses_signed    => false,
                                                  :want_assertions_signed     => false,
                                                  :want_assertions_encrypted  => false,
                                                  :want_name_id               => false,
                                                  :metadata_signed            => false,
                                                  :embed_sign                 => true,
                                                  :digest_method              => XMLSecurity::Document::SHA1,
                                                  :signature_method           => XMLSecurity::Document::RSA_SHA1
                                                }
end
