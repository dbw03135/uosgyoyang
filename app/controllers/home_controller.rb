class HomeController < ApplicationController
  def index
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2017&term=A10&subjectDiv=A01"),nil,'EUC-KR')

    @subj=doc.xpath('//list')
  end
  def all
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2017&term=A10&subjectDiv=A01"),nil,'EUC-KR')

    @subj=doc.xpath('//list')
  end
  def mungwa
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2017&term=A10&subjectDiv=A01"),nil,'EUC-KR')

    @subj=doc.xpath('//list')
  end
end
