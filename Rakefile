#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

namespace :topcoat do

  desc "Pull latest Topcoat version"
  task :pull do
    if !system "cd topcoat && git pull"
      abort "...."
    end
  end

  TOPCOAT_FONTS = FileList["topcoat/font/*.*"]
  ASSETS_FONTS = TOPCOAT_FONTS.pathmap("app/assets/fonts/topcoat/%f")
  ASSETS_FONTS.zip(TOPCOAT_FONTS).each do |target, source|
    file target => [source] { cp source, target, verbose: true }
  end

  TOPCOAT_CSS = FileList["topcoat/css/*.*"].exclude(/min/)
  ASSETS_CSS = TOPCOAT_CSS.pathmap("app/assets/stylesheets/topcoat/%f")
  ASSETS_CSS.zip(TOPCOAT_CSS).each do |target, source|
    target.gsub!(/topcoat-/, '')
    target.gsub!(/css/, 'scss')
    # file target => [source] { cp source, target, verbose: true }
    File.open(target,'w') do |output_file|
      output_file.puts File.read(source).gsub(/url\("..\/font\/(.*)"\)/, 'font-url("topcoat/\1")').gsub(/url\("..\/img\/(.*)"\)/, 'image-url("topcoat/\1")')
    end
  end

  TOPCOAT_IMAGES = FileList["topcoat/img/*.*"]
  ASSETS_IMAGES = TOPCOAT_IMAGES.pathmap("app/assets/images/topcoat/%f")
  ASSETS_IMAGES.zip(TOPCOAT_IMAGES).each do |target, source|
    file target => [source] { cp source, target, verbose: true }
  end

  desc "Update Topcoat's Fonts"
  task :fonts => ASSETS_FONTS

  desc "Update Topcoat's Stylesheets"
  task :css => ASSETS_CSS

  desc "Update Topcoat's Images"
  task :images => ASSETS_IMAGES

  desc "Clean gem assets files"
  task :clean do
    FileUtils.rm_rf 'app/assets'
    FileUtils.mkpath 'app/assets/fonts/topcoat'
    FileUtils.mkpath 'app/assets/images/topcoat'
    FileUtils.mkpath 'app/assets/stylesheets/topcoat'
  end

  desc "Update Topcoat's Assets"
  task :assets => [:pull, :clean, :fonts, :images, :css]
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end
