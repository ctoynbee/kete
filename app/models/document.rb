class Document < ActiveRecord::Base
  # all the common configuration is handled by this module
  include ConfigureAsKeteContentItem

  # handles file uploads
  # we'll want to adjust the filename to include "...-1..." for each
  # version where "-1" is dash-version number
  # for images this will include thumbnails
  # this will require overriding full_filename method locally
  # TODO: add more content_types
  # processor none means we don't have to load expensive image manipulation
  # dependencies that we don't need
  # :file_system_path => "#{BASE_PRIVATE_PATH}/#{self.table_name}",
  # will rework with when we get to public/private split
  # TODO: needs some of the new filetypes like openoffice, pages, plenty of old ones, too
  has_attachment :storage => :file_system, :file_system_path => "public/documents", :content_type => ['application/mac-binhex40', 'application/msword', 'application/pdf', 'application/pics-rules', 'application/postscript', 'application/rtf', 'application/vnd.ms-excel', 'application/vnd.ms-powerpoint', 'application/x-gtar', 'application/x-gzip', 'application/zip', 'text/html', 'text/plain'], :processor => :none
  validates_as_attachment

  # overriding full_filename to handle our customizations
  # TODO: is this thumbnail arg necessary for classes without thumbnails?
  # def full_filename(thumbnail = nil)
    # file_system_path = (thumbnail ? thumbnail_class : self).attachment_options[:file_system_path].to_s
    # this is how this currently reads
    # rails_root/private/documents/recording_id/filename
    # TODO: we'll want to make it like this when we add kete (basket) scoping
    # rails_root/private/kete_path_name/documents/recording_id/filename
    # File.join(RAILS_ROOT, file_system_path, attachment_path_id, thumbnail_name_for(thumbnail))
  # end
end