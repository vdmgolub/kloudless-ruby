require_relative "../test_helper"

class Kloudless::MultipartUploadTest < Minitest::Test
  def test_init_multipart_upload
    Kloudless.http.expect(:post, returns: {"id" => "foo"}, args:["/accounts/1/multipart", params: {overwrite: true}]) do
      upload = Kloudless::MultipartUpload.init(account_id: 1, overwrite: true)
      assert_kind_of Kloudless::MultipartUpload, upload
    end
  end

  def test_retrieve_multipart_upload
    Kloudless.http.expect(:get, returns: {"id" => "foo"}, args:["/accounts/1/multipart/2"]) do
      upload = Kloudless::MultipartUpload.retrieve(account_id: 1, multipart_id: 2)
      assert_kind_of Kloudless::MultipartUpload, upload
    end
  end

  def test_upload_multipart_upload
    Kloudless.http.expect(:put, args: ["/accounts/1/multipart/2", params: {part_number: 1}]) do
      upload = Kloudless::MultipartUpload.upload(account_id: 1, multipart_id: 2, part_number: 1)
      assert_kind_of Kloudless::MultipartUpload, upload
    end
  end

  def test_finalize_multipart_upload
    Kloudless.http.expect(:post, args: ["/accounts/1/multipart/2/complete"]) do
      upload = Kloudless::MultipartUpload.finalize(account_id: 1, multipart_id: 2)
      assert_kind_of Kloudless::MultipartUpload, upload
    end
  end

  def test_abort_multipart_upload
    Kloudless.http.expect(:delete, args: ["/accounts/1/multipart/2"]) do
      upload = Kloudless::MultipartUpload.abort(account_id: 1, multipart_id: 2)
      assert_kind_of Kloudless::MultipartUpload, upload
    end
  end
end
