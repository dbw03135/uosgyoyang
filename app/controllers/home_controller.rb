class HomeController < ApplicationController
  require 'open-uri'

  def index
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2019&term=A20&subjectDiv=A01"),nil,'EUC-KR')
    @subj=doc.xpath('//list')
  end
  def all
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2019&term=A20&subjectDiv=A01"),nil,'EUC-KR')
    @subj=doc.xpath('//list')
  end
  def mungwa
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2019&term=A20&subjectDiv=A01"),nil,'EUC-KR')
    @subj=doc.xpath('//list')
  end
  def major
    doc = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrMjTimeInq.oapi?apiKey=201605329QCU92763&year=2019&term=A20&deptDiv=%20&dept=%20&subDept=%20"),nil,'EUC-KR')
    doc2 = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcrCultTimeInq.oapi?apiKey=201605329QCU92763&year=2019&term=A20&subjectDiv=A07"),nil,'EUC-KR')

    @subj=doc.xpath('//list')
    @subj2=doc2.xpath('//list')
  end
  def estimate
    @year = 2018
    @term = 2
    results = []
    
    estimates = Nokogiri::XML(open("http://wise.uos.ac.kr/uosdoc/api.ApiUcsLecturerEstimateResultInq.oapi?apiKey=201605329QCU92763&year=#{@year}&term=A#{@term}0&subjectNm=asdfasdfasdf&subjectNo=#{params[:id]}"),nil,'EUC-KR')
    estimates = estimates.xpath('//list')
    
    estimates.each do |node|
      puts node.xpath('prof_nm').text.strip

      if node.xpath('prof_nm').text.strip == params[:prof_nm]
        results << node.xpath('raw_score').text.strip.to_f
      end
    end

    if results.length != 0
      @average = results.inject{ |sum, el| sum + el }.to_f / results.size
      @average = (@average*100).round / 100.0
    else
      @average = -1
    end

    @json = {'average'=> @average}

    respond_to do |format|
      format.html
      format.json { render json: @json }
    end
    
  end
end
