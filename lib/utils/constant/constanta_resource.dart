//main url
const urlApi = "10.10.12.88";

//path untuk get Token
const tokenPath = "/csf-oauth2-pub/oauth2/ClientCredentials";

//path untuk akses kontrak
const getCustContPath = "/csf-srvc-pub/sisola/contracts/getsumbycustemail";

//path untuk akses kontrak
const getReleaseBpkbPath = "/csf-srvc-pub/sisola/contracts/releasebpkb";

//path untuk akses kontrak
const getChangeDueDatePath = "/csf-srvc-pub/sisola/contracts/cdd";

//path untuk akses klaim asuransi
const getInsuranceClaimPath = "/csf-srvc-pub/sisola/contracts/claiminsc";

//Spesial code untuk signature
const spesialCode = "C5F5150L4";

//client id
const clientId = "SISOLA01";
const clientSecret = "02e0f2bdeed0aa1208c4ebf68a65e65b5276e6a6";
const grantType = "client_credentials";
const scope = "basic";
