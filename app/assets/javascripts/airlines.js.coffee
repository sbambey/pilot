# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#s3-uploader").S3Uploader
  	progress_bar_target: $('.js-progress-bars')