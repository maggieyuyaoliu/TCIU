% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fmri_post_hoc.R
\name{fmri_post_hoc}
\alias{fmri_post_hoc}
\title{post-hoc process for p values}
\usage{
fmri_post_hoc(
  p_val_3d,
  fdr_corr = NULL,
  spatial_cluster.thr = NULL,
  spatial_cluster.size = NULL,
  show_comparison = FALSE,
  ...
)
}
\arguments{
\item{p_val_3d}{an array which contains the p-values as the result of fMRI statistical tests.}

\item{fdr_corr}{The default is NULL. Input 'fdr' to conduct FDR correction.}

\item{spatial_cluster.thr}{The default is NULL. Together with spatial_cluster.size are used to filter contiguous clusters of locations in a 3D array that are below some threshold and with some minimum size.}

\item{spatial_cluster.size}{The default is NULL. The size of spatial cluster.}

\item{show_comparison}{The default is FALSE. If TRUE, the output would display the comparison between raw and processed p-values.}

\item{...}{One can specify breaks etc. to modify the comparison histogram in ggplot2.}
}
\value{
3D p-values after FDR correction or spatial clustering
}
\description{
This function is used to conduct the post-hoc process (i.e. FDR correction and spatial clustering) for a 3-dimensional p-value array.
}
\details{
The function \code{fmri_post_hoc} would help do the FDR correction and spatial clustering for a 3d p-value array. The FDR correction controls for a low proportion of false positives, while the spatial clustering part help filter out all sparse p-values that are not in specified clusters.
}
\examples{
# sample 3D p value provided by the package
dim(phase2_pval)
\donttest{
# do the FDR correction
pval_fdr = fmri_post_hoc(phase2_pval, 
                         fdr_corr = 'fdr',
                         spatial_cluster.thr = NULL,
                         spatial_cluster.size = NULL, 
                         show_comparison = FALSE)

# do the spatial clustering
pval_posthoc = fmri_post_hoc(pval_fdr,
                             fdr_corr = NULL,
                             spatial_cluster.thr = 0.05,
                             spatial_cluster.size = 5, 
                             show_comparison = FALSE)
}
}
\author{
SOCR team <\url{http://socr.umich.edu/people/}>
}
