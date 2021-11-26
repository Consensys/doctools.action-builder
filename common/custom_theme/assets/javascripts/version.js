// default version list in case of JSON loading issue
let versions = {
  versions: {
    en: ["latest"]
  }
};
const cleanSiteUrl = site_root.replace(/\/+$/i, '');

// is the version passed as param the one displayed accoring to the url
function isDisplayedVersion(version){
  return site_current_version === version;
}

// Update the drop down list and set active version
function updateVersionsDropDown(versions, currentLanguage, currentVersion){
  $("#__version").empty();
  $.each( versions.versions[currentLanguage], function( index, version ) {
    var item = $( `<option value="${version}">${version}</option>" `);

    if(isDisplayedVersion(version)){
      item.attr("selected","selected");
      document.title = `${document.title} - ${version}`;
    }

    item.appendTo("#__version");
  });
}

// set the global versions value from the Json file,
// update dropdown on completions
function getVersionsFromJsonFile(){
  $.ajaxSetup({ cache: false });
  $.getJSON( `${cleanSiteUrl}/versions.json` , function( data ) {
    if(!jQuery.isEmptyObject(data)){ versions = data; }
  })
  .always(
    function() {
      updateVersionsDropDown(versions, site_current_language, site_current_version);
    }
  );
}

$(function() {
  getVersionsFromJsonFile();
});

$('#__version').change(function(){
  const targetVersion = $(this).val();
  console.log(targetVersion);
  window.location.href = cleanSiteUrl + "/" + site_current_language + "/" + targetVersion;
  return false
});
