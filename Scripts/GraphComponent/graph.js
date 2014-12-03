/*
 *  Project: Graph Component
 *  Description: Graph jQuery plugin for WebRatio Graph Component that wrap vivagraph.js
 *  Author:  Emanuele Galbiati (emanuele.galbiati@webratio.com)
 *
 *  Require: vivagraph.js
 */

;
(function($, window, undefined) {

  var document = window.document,
    defaults = {};

  function Graph(element, options) {
    this.element = element;
    this.id = $(element).attr('id');
    this.options = $.extend({}, defaults, options);

    this.init();
  }

  Graph.prototype.init = function() {

    var data = $.parseJSON($("#" + this.id + "_data").text()),
      nodeCounter = {},
      maxNode = "",
      maxNodeValue = 0,
      graph = Viva.Graph.graph(),
      layout = Viva.Graph.Layout.forceDirected(graph, {
        springLength: 100,
        springCoeff: 0.00055,
        dragCoeff: 0.09,
        gravity: -5
      }),
      graphics = Viva.Graph.View.svgGraphics(),
      highlightRelatedNodes = function(nodeId, isOn) {
        // just enumerate all realted nodes and update link color:
        var node = graphics.getNodeUI(nodeId),
          txt = $('text', node),
          rect = $('rect', node);

        if (isOn) {
          $(node).parent().append(node);
          txt.show();
          rect[0].attr('width', txt[0].getBBox().width + 10);
          rect.show();
        } else {
          txt.hide();
          rect.hide();
        }
        graph.forEachLinkedNode(nodeId, function(node, link) {
          var linkUI = graphics.getLinkUI(link.id);
          if (linkUI) {
            // linkUI is a UI object created by graphics below
            linkUI.attr('stroke', isOn ? 'red' : 'gray');
          }
        });
      },
      onMouseOver = function(event) {
        highlightRelatedNodes(node.id, true);
      },

      onMouseOut = function(event) {
        highlightRelatedNodes(node.id, false);
      },

      onClick = function(nodeId) {
        var node = graph.getNode(nodeId),
          data = node.data;

        console.log('tapped ', node.data);
        if (data.ajaxLink) {
          var ajaxCall = (data.ajaxLink.indexOf("return") === 0) ? data.ajaxLink.slice(6) : data.ajaxLink;
          ajaxCall = ajaxCall.split('&amp;').join('&');
          eval(ajaxCall);
        }

        if (data.link) {
          console.log("follow link " + data.link);
        }

      };

    graphics.node(function(node) {
      var nodeSize = 24,
        ui = Viva.Graph.svg('g');

      if (node.data.image) {
        ui.append('image')
          .attr('width', nodeSize)
          .attr('height', nodeSize)
          .link(node.data.image);
      } else {
        ui.append('rect')
          .attr('width', nodeSize)
          .attr('height', nodeSize)
          .attr('fill', 'gray');
      }

      var titleBg = ui.append('rect')
        .attr('fill', 'white')
        .attr('fill-opacity', '0.8')
        .attr('y', 30)
        .attr('x', -17)
        .attr('height', 18);

      var text = ui.append('text')
        .attr('x', '-12').attr('y', '44')
        .attr('font-size', '14')
        .attr('fill', 'gray')
        .text(node.data.label);


      $(titleBg).hide();
      $(text).hide();

      ui.offsetX = -nodeSize / 2;
      ui.offsetY = -nodeSize / 2;

      $(ui).hover(function() { // mouse over
        highlightRelatedNodes(node.id, true);
      }, function() { // mouse out
        highlightRelatedNodes(node.id, false);
      })
        .click(function() {
          onClick(node.id);
        }).css('cursor', 'pointer');

      return ui;
    }).placeNode(function(nodeUI, pos) {
      nodeUI.attr("transform", "translate(" + (pos.x + nodeUI.offsetX) + ", " + (pos.y + nodeUI.offsetY) + ")");
    });

    for (var i = data.nodes.length - 1; i >= 0; i--) {
      var current = data.nodes[i];
      current.id = current.id || current.key;
      graph.addNode(current.id, current);
    };

    for (var i = data.edges.length - 1; i >= 0; i--) {
      var current = data.edges[i];
      graph.addLink(current.key, current.edgeKey);
      nodeCounter[current.key] = (nodeCounter[current.key] || 0) + 1;
      nodeCounter[current.edgeKey] = (nodeCounter[current.edgeKey] || 0) + 1;
    };

    this.renderer = Viva.Graph.View.renderer(graph, {
      layout: layout,
      graphics: graphics,
      container: this.element,
      renderLinks: true
    });

    this.renderer.run();

    this.graph = graph;


    /* Fix for firefox */
    console.log(this);
    $(this.element).css('overflow', 'hidden').children().css('overflow', 'visible');
  };


  $.fn["graph"] = function(options) {
    return this.each(function() {
      if (!$.data(this, 'graph')) {
        $.data(this, 'graph', new Graph(this, options));
      }
    });
  }

}(jQuery, window));