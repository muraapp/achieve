require 'rails_helper'

describe Contact do
  # 名前とメールアドレスと内容があれば有効な状態であること
  it "is valid with name" do
    contact = Contact.new(name: 'ああ' ,email: 'aaa@aaa.com', content: '暑いです')
    expect(contact).to be_valid
  end


  # 名前はあるが、メールアドレスか内容がない場合は無効
  context "is valid with name" do
    it "is invalid without email or content" do
      contact = Contact.new(name: "sample")
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
  end

  # メールアドレスはあるが、名前か内容がない場合は無効
  context "is valid with email" do
    it "is invalid without name or content" do
      contact = Contact.new(email: "sample@sample.com")
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
  end

  # 内容はあるが、名前かメールアドレスがない場合は無効
  context "is valid with content" do
    it "is invalid without name or email" do
      contact = Contact.new(content: "samplecontent")
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
  end




end
