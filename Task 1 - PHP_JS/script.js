document.addEventListener('DOMContentLoaded', () => {
  const grid = document.querySelector('.grid-container');
  let draggedCell = null;

  grid.addEventListener('dragstart', (e) => {
      if (e.target.classList.contains('cell')) {
          draggedCell = e.target;
          e.dataTransfer.setData('text/plain', Array.from(grid.children).indexOf(draggedCell));
          e.target.classList.add('dragging');
      } else {
          e.preventDefault();
      }
  });

  grid.addEventListener('dragend', () => {
      if (draggedCell) {
          draggedCell.classList.remove('dragging');
          draggedCell = null;
      }
  });

  grid.addEventListener('dragover', (e) => {
      e.preventDefault();
      const targetCell = e.target.closest('.cell');
      if (targetCell && targetCell !== draggedCell) {
          const targetRect = targetCell.getBoundingClientRect();
          const dropPosition = e.clientX - targetRect.left;

          targetCell.classList.remove('over-left', 'over-right');
          targetCell.classList.add(dropPosition < targetRect.width / 2 ? 'over-left' : 'over-right');
      }
  });

  grid.addEventListener('dragleave', (e) => {
      const targetCell = e.target.closest('.cell');
      if (targetCell && targetCell !== draggedCell) {
          targetCell.classList.remove('over-left', 'over-right');
      }
  });

  grid.addEventListener('drop', (e) => {
      e.preventDefault();
      const targetCell = e.target.closest('.cell');
      if (targetCell && targetCell !== draggedCell) {
          const targetRect = targetCell.getBoundingClientRect();
          const dropPosition = e.clientX - targetRect.left;
          const targetIndex = Array.from(grid.children).indexOf(targetCell);

          grid.querySelectorAll('.cell').forEach(cell => cell.classList.remove('dragging', 'over-left', 'over-right'));

          if (dropPosition < targetRect.width / 2) {
              grid.insertBefore(draggedCell, grid.children[targetIndex]);
          } else {
              grid.insertBefore(draggedCell, grid.children[targetIndex].nextSibling);
          }

          updateOrder();
      }
  });

  function updateOrder() {
      const cellIds = Array.from(grid.children).map(cell => cell.getAttribute('data-id'));
      fetch('/tagsdb/update_order.php', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(cellIds),
      })
      .then(response => response.ok ? response.json() : Promise.reject('Network response was not ok'))
      .then(data => console.log('Order updated successfully:', data))
      .catch(error => console.error('Error updating order:', error));
  }
});
