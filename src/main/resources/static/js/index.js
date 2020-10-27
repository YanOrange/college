var jsonEditor = (function(){

  var JE = {};

  JE.init = function(){

    this.pre = document.querySelector("code.json");
    this.titleInput = document.querySelector(".title");
    this.contentInput = document.querySelector(".content");
    this.abstractContentInput = document.querySelector(".abstractContent");
    this.keyWordsInput = document.querySelector(".keyWords");
    this.title = this.title || "请输入标题";
    this.abstractContent = this.abstractContent || "请输入摘要";
    this.keyWords = this.keyWords || "请输入关键字";
    this.content = this.content || "<p>请在这里输入正文...</p>";
    this.date = this.getDate();
    this.titleInput.value = this.title;
    this.contentInput.value = this.content;
    this.abstractContentInput.value = this.abstractContent;
    this.keyWordsInput.value = this.keyWords;

    this.tinymce = this.runTinymce();
    this.binding();
    // this.showJson();

 };

  JE.binding = function(){
    this.titleInput.addEventListener("keyup", this.titleChange);
    this.abstractContentInput.addEventListener("keyup", this.abstractContentChange);
      this.keyWordsInput.addEventListener("keyup", this.keyWordsChange);
  };

  // handler for title keyup
  JE.titleChange = function(){
     var that = JE;
     that.title = this.value;
     // that.showJson();

  };

    JE.abstractContentChange = function(){
        var that = JE;
        that.abstractContent = this.value;
        // that.showJson();

    };

    JE.keyWordsChange = function(){
        var that = JE;
        that.keyWords = this.value;
        // that.showJson();

    };

  // format a date like April 20, 2014
  JE.getDate = function(){
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var d = new Date();
    var day = d.getDate();
    var month = d.getMonth();
    var year = d.getFullYear();
    return months[month] + " " + day + ", " + year;
  };

  // passing content from tinymce event
  JE.contentChange = function(content){
     this.content = content;
     // this.showJson();
  };

  // updates json
  // JE.showJson = function(){
  //   this.pre.innerHTML = this.makeJson();
  // };


  JE.makeJson = function(){
    // replace brackets with entities
    this.content = this.content.replace(/<|>/g, function(chr){
        return chr == "<" ? "&lt;" : "&gt;";
    });
     // replace newline char with nothing
    this.content = this.content.replace(/\n/g, "");
    var json = JSON.stringify(this.makePost.call(this), null, " ");

    return json;

  };
  // make a post object
  JE.makePost = function(){
    var title = this.title;
    var content = this.content;
    var date = this.date;
    return {
      post:
      {
        date: date,
        title: title,
        content: content
      }
    };
  };

  // run tinymce.
  JE.runTinymce = function(){
    var that = this;
    tinymce.init({
      selector: ".content",
      plugins: "code, link, fullscreen, preview",
      setup: function(ed){
        ed.on("keyup", function(){
          that.contentChange(this.getContent());
        });
      }
    });

    return tinymce;
  };


  JE.submit = function () {
      var that = this;
      var title = that.title;
      var abstractContent = that.abstractContent;
      var keyWords = that.keyWords;
      var content = that.content;
      // var content = tinymce.editors.getContent()
      console.log(content)
      var data = {
          title:title,
          abstractContent:abstractContent,
          keyWords:keyWords,
          content:content
      }
      jQuery.ajax({
          url:'/essay/save',
          data:JSON.stringify(data),
          dataType:'json',
          type:'post',
          contentType: "application/json;charset=UTF-8",
          success:function (res) {
              if (res.success){
                  layer.msg('上传成功！', {
                  }, function(){
                      location.reload();
                  });
              }
          }


      })
  }

  return JE;
})();

jsonEditor.init();
