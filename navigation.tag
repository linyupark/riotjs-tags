<pagination>
  <style scoped>
  </style>
  <ul class="pagination">
    <li>
      <a href="javascript:;" class="{'disabled': !var.has_prev_page}" onclick="{fn.prev_page}">
        <i class="fa fa-caret-left" aria-hidden="true"></i>
        上页
      </a>
    </li>
    <li>
      <select onchange="{fn.jump_page}">
        <option each="{page in var.page_list}" value="{page}" selected="{var.page==page}">{page}</option>
      </select>
    </li>
    <li>
      <a href="javascript:;" class="{'disabled': !var.has_next_page}" onclick="{fn.next_page}">
        下页
        <i class="fa fa-caret-right" aria-hidden="true"></i>
      </a>
    </li>
  </ul>
  <script>
  var _this = this;
  this.var = {};
  this.fn = {
    // 循环总页数生成option选项
    page_list: function(){
      var page = 1;
      _this.var.page_list = [];
      for(page; page <= _this.var.pages; page++){
        _this.var.page_list.push(page);
      }
      _this.update();
    },
    // 跳转页
    jump_page: function(e){
      _this.fn.page_to(e.target.value);
    },
    // 上一页
    prev_page: function(){
      if(_this.var.has_prev_page)
      _this.fn.page_to(_this.var.page - 1);
    },
    // 下一页
    next_page: function(){
      if(_this.var.has_next_page)
      _this.fn.page_to(_this.var.page + 1);
    },
    // 前后页是否可用
    page_render: function(){
      _this.var.has_next_page = _this.var.pages > _this.var.page;
      _this.var.has_prev_page = _this.var.page > 1;
      _this.update();
    },
    // 切换页面
    page_to: function(n){
      _this.var.page = Number(n);
      _this.fn.page_render();
      _this.trigger("page_to", n);
    }
  };
  this.on("mount", function(){
    this.var.pages = Number(opts.pages);
    this.var.page = Number(opts.page) || 1;
    this.fn.page_list();
    this.fn.page_render();
  });
  </script>
</pagination>