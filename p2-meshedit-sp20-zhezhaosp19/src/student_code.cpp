#include "student_code.h"
#include "mutablePriorityQueue.h"

using namespace std;

namespace CGL
{

  /**
   * Evaluates one step of the de Casteljau's algorithm using the given points and
   * the scalar parameter t (class member).
   *
   * @param points A vector of points in 2D
   * @return A vector containing intermediate points or the final interpolated vector
   */


  std::vector<Vector2D> BezierCurve::evaluateStep(std::vector<Vector2D> const &points)
  { 
    // TODO Part 1.
    std::vector<Vector2D> inter_controlPoints;
    if(points.size() <= 1) {
        return points;
    }
    for(int i = 0; i < points.size() - 1; i++) {
        Vector2D p1n = (1 - t) * points[i] + t * points[i + 1];
        inter_controlPoints.push_back(p1n);
    }
    return inter_controlPoints;
  }

  /**
   * Evaluates one step of the de Casteljau's algorithm using the given points and
   * the scalar parameter t (function parameter).
   *
   * @param points    A vector of points in 3D
   * @param t         Scalar interpolation parameter
   * @return A vector containing intermediate points or the final interpolated vector
   */
  std::vector<Vector3D> BezierPatch::evaluateStep(std::vector<Vector3D> const &points, double t) const
  {
    // TODO Part 2.
      std::vector<Vector3D> inter_controlPoints;
      if(points.size() <= 1) {
          return points;
      }
      for(int i = 0; i < points.size() - 1; i++) {
        Vector3D p1n = (1 - t) * points[i] + t * points[i + 1];
        inter_controlPoints.push_back(p1n);
      }
      return inter_controlPoints;
  }

  /**
   * Fully evaluates de Casteljau's algorithm for a vector of points at scalar parameter t
   *
   * @param points    A vector of points in 3D
   * @param t         Scalar interpolation parameter
   * @return Final interpolated vector
   */
  Vector3D BezierPatch::evaluate1D(std::vector<Vector3D> const &points, double t) const
  {
    // TODO Part 2.
      int level = points.size();
      std::vector<Vector3D> next_controlPoints = points;
      if(level == 1) {
          return points[0];
      }
      while(level > 1) {
          next_controlPoints = evaluateStep(next_controlPoints, t);
          level--;
      }
      return next_controlPoints[0];
  }

  /**
   * Evaluates the Bezier patch at parameter (u, v)
   *
   * @param u         Scalar interpolation parameter
   * @param v         Scalar interpolation parameter (along the other axis)
   * @return Final interpolated vector
   */
  Vector3D BezierPatch::evaluate(double u, double v) const 
  {  
    // TODO Part 2.
      std::vector<Vector3D> u_controlPoints;
      for(int i = 0; i < controlPoints.size(); i++) {
          u_controlPoints.push_back(evaluate1D(controlPoints[i], u));
      }
      return evaluate1D(u_controlPoints, v);
  }

  Vector3D Vertex::normal( void ) const
  {
    // TODO Part 3.
    // Returns an approximate unit normal at this vertex, computed by
    // taking the area-weighted average of the normals of neighboring
    // triangles, then normalizing.
      Vector3D vertex(0, 0, 0);
      HalfedgeCIter h = this -> halfedge();
      do {
//          Vector3D p1 = this -> position;
          HalfedgeCIter h_twin = h -> twin();
          vertex += h_twin -> face() -> normal();
          h = h_twin -> next();
      } while (h != this -> halfedge());
      return vertex.unit();
  }

  EdgeIter HalfedgeMesh::flipEdge( EdgeIter e0 )
  {
    // TODO Part 4.
    // This method should flip the given edge and return an iterator to the flipped edge.
      HalfedgeIter h0 = e0 -> halfedge();
      HalfedgeIter h1 = h0 -> twin();
      HalfedgeIter h2 = h0 -> next();
      HalfedgeIter h3 = h2 -> next();
      HalfedgeIter h4 = h1 -> next();
      HalfedgeIter h5 = h4 -> next();
      
      VertexIter v0 = h0 -> vertex();
      VertexIter v1 = h1 -> vertex();
      VertexIter v2 = h3 -> vertex();
      VertexIter v3 = h5 -> vertex();
      
      EdgeIter e1 = h2 -> edge();
      EdgeIter e2 = h3 -> edge();
      EdgeIter e3 = h4 -> edge();
      EdgeIter e4 = h5 -> edge();
      
      FaceIter f0 = h0 -> face();
      FaceIter f1 = h1 -> face();
      
      if(h0 -> isBoundary() /*|| h1 -> isBoundary() || h2 -> isBoundary() || h3 -> isBoundary() || h4 -> isBoundary() || h5 -> isBoundary()*/) {
          return e0;
      }
      
      h0 -> setNeighbors(h3, h1, v3, e0, f0);
      h1 -> setNeighbors(h5, h0, v2, e0, f1);
      h2 -> setNeighbors(h1, h2 -> twin(), v1, e1, f1);
      h3 -> setNeighbors(h4, h3 -> twin(), v2, e2, f0);
      h4 -> setNeighbors(h0, h4 -> twin(), v0, e3, f0);
      h5 -> setNeighbors(h2, h5 -> twin(), v3, e4, f1);
          
      v0 -> halfedge() = h4;
      v1 -> halfedge() = h2;
      v2 -> halfedge() = h1;
      v3 -> halfedge() = h0;
          
//          e0 -> halfedge() = h0;
//          e1 -> halfedge() = h2;
          
      f0 -> halfedge() = h0;
      f1 -> halfedge() = h1;
      return e0;
  }

  VertexIter HalfedgeMesh::splitEdge( EdgeIter e0 )
  {
    // TODO Part 5.
    // This method should split the given edge and return an iterator to the newly inserted vertex.
    // The halfedge of this vertex should point along the edge that was split, rather than the new edges.
      HalfedgeIter h0 = e0 -> halfedge();
      HalfedgeIter h1 = h0 -> twin();
      HalfedgeIter h2 = h0 -> next();
      HalfedgeIter h3 = h2 -> next();
      HalfedgeIter h4 = h1 -> next();
      HalfedgeIter h5 = h4 -> next();
      HalfedgeIter h12 = h2 -> twin();
      HalfedgeIter h13 = h3 -> twin();
      HalfedgeIter h14 = h4 -> twin();
      HalfedgeIter h15 = h5 -> twin();
      
      VertexIter v0 = h0 -> vertex();
      VertexIter v1 = h1 -> vertex();
      VertexIter v2 = h3 -> vertex();
      VertexIter v3 = h5 -> vertex();
      
      EdgeIter e1 = h2 -> edge();
      EdgeIter e2 = h3 -> edge();
      EdgeIter e3 = h4 -> edge();
      EdgeIter e4 = h5 -> edge();
      
      FaceIter f0 = h0 -> face();
      FaceIter f1 = h1 -> face();
      
      if(h0 -> isBoundary() /*|| h1 -> isBoundary() || h2 -> isBoundary() || h3 -> isBoundary() || h4 -> isBoundary() || h5 -> isBoundary()*/) {
          return e0 -> halfedge() -> vertex();
      }
      
      HalfedgeIter h6 = newHalfedge();
      HalfedgeIter h7 = newHalfedge();
      HalfedgeIter h8 = newHalfedge();
      HalfedgeIter h9 = newHalfedge();
      HalfedgeIter h10 = newHalfedge();
      HalfedgeIter h11 = newHalfedge();
      
      VertexIter v4 = newVertex();
      
      EdgeIter e5 = newEdge();
      EdgeIter e6 = newEdge();
      EdgeIter e7 = newEdge();
      
      FaceIter f2 = newFace();
      FaceIter f3 = newFace();
      
      h0 -> setNeighbors(h6, h1, v0, e0, f0);
      h1 -> setNeighbors(h4, h0, v4, e0, f1);
      h2 -> setNeighbors(h7, h12, v1, e1, f2);
      h3 -> setNeighbors(h0, h13, v2, e2, f0);
      h4 -> setNeighbors(h10, h14, v0, e3, f1);
      h5 -> setNeighbors(h9, h15, v3, e4, f3);
      h6 -> setNeighbors(h3, h7, v4, e5, f0);
      h7 -> setNeighbors(h8, h6, v2, e5, f2);
      h8 -> setNeighbors(h2, h9, v4, e6, f2);
      h9 -> setNeighbors(h11, h8, v1, e6, f3);
      h10 -> setNeighbors(h1, h11, v3, e7, f1);
      h11 -> setNeighbors(h5, h10, v4, e7, f3);
      
      v1 -> halfedge() = h9;
      v4 -> halfedge() = h8;
      v4 -> position = (v1 -> position + v0 -> position) / 2.0;
      v4 -> isNew = true;

      
      e5 -> halfedge() = h6;
      e6 -> halfedge() = h8;
      e7 -> halfedge() = h10;
      e0 -> isNew = false;
      e5 -> isNew = true;
      e6 -> isNew = false;
      e7 -> isNew = true;
      
      f0 -> halfedge() = h3;
      f1 -> halfedge() = h4;
      f2 -> halfedge() = h2;
      f3 -> halfedge() = h5;
      
      return v4;
  }



  void MeshResampler::upsample( HalfedgeMesh& mesh )
  {
    // TODO Part 6.
    // This routine should increase the number of triangles in the mesh using Loop subdivision.
      for(EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) { // new vertex positions
          e -> isNew = false;
          VertexIter a = e -> halfedge() -> vertex();
          VertexIter b = e -> halfedge() -> twin() -> vertex();
          VertexIter c = e -> halfedge() -> twin() -> next() -> next() -> vertex();
          VertexIter d = e -> halfedge() -> next() -> next() -> vertex();
          e -> newPosition = (3.0/8.0) * (a -> position + b -> position) + (1.0/8.0) * (c -> position + d -> position);
      }
      
      for(VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++) { // update old vertex positions
          v -> isNew = false;
          int n = v -> degree();
          double u;
          if (n == 3) {
              u = 3.0/16.0;
          } else {
              u = 3.0/(8.0 * (double)n);
          }
          Vector3D sum(0.0, 0.0, 0.0);
          HalfedgeCIter h = v -> halfedge();
          do {
              sum += h -> twin() -> vertex() -> position;
              h = h -> twin() -> next();
          }
          while (h != v -> halfedge());
          
          v -> newPosition = (1 - n * u) * v -> position + u * sum;
      }
      
      EdgeIter e = mesh.edgesBegin();
//      for (EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) { // edge splits
      while(e != mesh.edgesEnd()) {
          
          if(e -> halfedge() -> vertex() -> isNew == false && e -> halfedge() -> twin() -> vertex() -> isNew == false) {
              VertexIter new_v = mesh.splitEdge(e);
              new_v -> position = e -> newPosition;
              new_v -> isNew = true;
          }
          e++;
      }
//      cout<<"1"<<endl;

      for(EdgeIter e = mesh.edgesBegin(); e != mesh.edgesEnd(); e++) { // edge flips
          if(e -> isNew) {
              HalfedgeIter h = e -> halfedge();
              if ((h -> vertex() -> isNew && h -> twin() -> vertex() -> isNew == false) || (h -> vertex() -> isNew == false && h -> twin() -> vertex() -> isNew)) {
                  mesh.flipEdge(e);
                  e -> isNew = false;
              }
          }
      }
      
      for(VertexIter v = mesh.verticesBegin(); v != mesh.verticesEnd(); v++){
          if(v -> isNew == false) {
              v -> position = v -> newPosition;
          }
      }
      
  }
}
